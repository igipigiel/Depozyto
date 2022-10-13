﻿using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System;
using Depozyto.Models;
using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.Security.Claims;

namespace Depozyto.Controllers
{
    public class LoginController : Controller
    {



        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;

        bool canRegister;

        // Login
        [HttpGet]
        public IActionResult Index(UserModel usr)
        {
            if (usr.loggedIn)
            {
                ViewData["LoggedIn"] = "Zalogowano";
            }
            return View();
        }

        void connectionString()
        {

            //połączenia serwera
            con.ConnectionString = "Server=localhost\\SQLEXPRESS;Initial Catalog=epicDataBase;Persist Security Info=True;User ID=sa;Password=haslo";
        }



        //Logowanie
        public async Task<IActionResult> Index(LoginModel log, UserModel usr)
        {


            //sprawdza czy w bazie danych jest taki urzytkownik
            connectionString();
            con.Open();
            com.Connection = con;
            com.CommandText = "select * from dbo.Clients where Login='" + log.Login + "' and Haslo='" + log.Password + "'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                usr.Login = dr["Login"].ToString();
                usr.Password = dr["Haslo"].ToString();
                usr.Name = dr["Imie"].ToString();
                usr.LastName = dr["Nazwisko"].ToString();
                usr.Email = dr["Email"].ToString();

                con.Close();
                //znalazl urzytkownika

                log.loggedIn = true;
                usr.loggedIn = true;

                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Email,usr.Email),
                    new Claim(ClaimTypes.Name,usr.Name)
                };

                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new System.Security.Claims.ClaimsPrincipal(claimsIdentity));


                return RedirectToAction("Index", "Home");
            }
            else
            {
                //nie znalazl urzytkownika
                con.Close();
                log.loggedIn = false;
                ViewData["LoginFlag"] = "Nieprawidłowy login lub hasło!!!";
                return View();
            }




        }

        // Login/Register
        public ActionResult Register()
        {

            return View();
        }

        //sprawdza czy mozemy zapisac uzytkownika w bazie danych (czy nie ma tos takiego loginu itp)
        void CheckRegister(RegisterModel reg)
        {
            //sprawdza czy w bazie danych jest już taki urzytkownik
            connectionString();
            con.Open();
            com.Connection = con;
            com.CommandText = "select * from dbo.Clients where Login='" + reg.Login + "'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                con.Close();
                //jest taki urzytkownik (nie mozna zarejestrowac)
                canRegister = false;
            }
            else
            {
                con.Close();
                //nie ma takiego urzttkownika (mozna zarejestrowac)
                canRegister = true;
            }
        }

        //Tutaj zapisujemy dane na bazie danych
        [HttpPost]
        public ActionResult CreateAccount(RegisterModel reg)
        {
            //sprawdzamy czy mozemy zarejestrowac nowego klienta
            CheckRegister(reg);


            if (canRegister)
            {
                connectionString();
                SqlCommand com = new SqlCommand("SP_Client", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Login", reg.Login);
                com.Parameters.AddWithValue("@Haslo", reg.Password);
                com.Parameters.AddWithValue("@Imie", reg.Name);
                com.Parameters.AddWithValue("@Nazwisko", reg.LastName);
                com.Parameters.AddWithValue("@Email", reg.Email);
                con.Open();
                int i = com.ExecuteNonQuery();
                con.Close();
                if (i >= 1)
                {
                    //Success
                    return View();
                }
                else
                {
                    //Failed
                    return View("Register");
                }
            }
            else
            {
                //nie moze zarejestrowac
                ViewData["LoginDouble"] = "Login jest już zajęty przez innego urzytkownika";
                return View("Register");
            }

        }

        public IActionResult Logout()
        {
            Response.Cookies.Delete("sesja");

            return RedirectToAction("Index", "Home");
        }
    }
}
