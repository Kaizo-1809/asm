using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using asm.Data;
using asm.Models;
using Microsoft.AspNetCore.Identity;
using Newtonsoft.Json;

namespace asm.Controllers
{
    public class OrdersController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ApplicationDbContext _dbContext;

        public OrdersController(ApplicationDbContext dbContext, UserManager<IdentityUser> userManager)
        {
            _dbContext = dbContext;
            _userManager = userManager;
        }

        [HttpPost]
        public async Task<IActionResult> CreateOrder()
        {
            var cart = HttpContext.Session.GetString("cart");
            if (cart != null)
            {
                var user = await _userManager.GetUserAsync(User);

                if (user != null)
                {
                    var dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);

                    Order order = new Order
                    {
                        UserId = user.Id,
                        OrderDate = DateTime.Now,
                        OrderItems = dataCart.Select(cartItem => new OrderItem
                        {
                            BookId = cartItem.Book.Id,
                            Quantity = cartItem.Quantity,
                            Price = cartItem.Book.Price
                        }).ToList()
                    };

                    _dbContext.Order.Add(order);
                    _dbContext.SaveChanges();

                    HttpContext.Session.Remove("cart");

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return RedirectToAction("Login", "Account");
                }
            }
            else
            {
                return RedirectToAction("ListCart", "Products");
            }
        }
    }
}
