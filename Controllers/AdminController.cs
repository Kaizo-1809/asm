using asm.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace asm.Controllers
{
        public class AdminController : Controller
        {
            private readonly UserManager<IdentityUser> _userManager;
            private readonly ApplicationDbContext _db;

        public AdminController(UserManager<IdentityUser> userManager, ApplicationDbContext db)
            {
                _db = db;
                _userManager = userManager;
            }
        [Authorize(Roles = "ADMIN")]
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult User()
            {
                var users = _userManager.Users.ToList();
                return View(users);
            }

        public IActionResult Order()
        {
            var orders = _db.Order.ToList();
            return View(orders);
        }
    }
}