using asm.Data;
using asm.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Linq;

namespace asm.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _db;
        private readonly UserManager<IdentityUser> _userManager;
        public HomeController(ILogger<HomeController> logger, ApplicationDbContext db,
            UserManager<IdentityUser> userManager)
        {
            this._db = db;
            _logger = logger;
            _userManager = userManager;
        }

        public IActionResult Index(string searchString, int category)
        {
            var categories = GetCategories();
            var books = _db.Book.Include(b => b.Category).AsQueryable();
            if (category > 0)
            {
                books = books.Where(b => b.CategoryId == category);
            }

            if (!string.IsNullOrEmpty(searchString))
            {
                var searchStringLower = searchString.ToLower();
                books = books.Where(b => b.Title.ToLower().Contains(searchStringLower));
            }

            ViewBag.Categories = categories;
            ViewBag.Book = books;
            return View();
        }

        private List<Category> GetCategories()
        {
            var categories = _db.Category.ToList();
            return categories;
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _db.Book == null)
            {
                return NotFound();
            }

            var book = await _db.Book
                .FirstOrDefaultAsync(m => m.Id == id);
            if (book == null)
            {
                return NotFound();
            }

            return View(book);
        }


        public Book GetDetailProduct(int id)
        {
            var books = _db.Book.Find(id);
            return books;
        }

        [Authorize(Roles = "CUS, ADMIN")]
        public IActionResult AddCart(int id)
        {
            var cart = HttpContext.Session.GetString("cart");
            if (cart == null)
            {
                var book = GetDetailProduct(id);
                List<Cart> listCart = new List<Cart>()
                {
                    new Cart
                    {
                        Book = book,
                        Quantity = 1
                    }
                };
                HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(listCart));
            }
            else
            {
                List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                bool check = true;
                for (int i = 0; i < dataCart.Count; i++)
                {
                    if (dataCart[i].Book.Id == id)
                    {
                        dataCart[i].Quantity++;
                        check = false;
                    }
                }
                if (check)
                {
                    dataCart.Add(new Cart
                    {
                        Book = GetDetailProduct(id),
                        Quantity = 1
                    });
                }
                HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(dataCart));
            }
            return RedirectToAction("Index");

        }

        [Authorize(Roles = "CUS, ADMIN")]
        public IActionResult UpdateCart(int id, int quantity)
        {
            var cart = HttpContext.Session.GetString("cart");
            if (cart != null)
            {
                List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                if (quantity > 0)
                {
                    for (int i = 0; i < dataCart.Count; i++)
                    {
                        if (dataCart[i].Book.Id == id)
                        {
                            dataCart[i].Quantity = quantity;
                        }
                    }
                    HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(dataCart));
                }
                return Ok(quantity);
            }
            return BadRequest();
        }

        [Authorize(Roles = "CUS, ADMIN")]
        public IActionResult DeleteCart(int id)
        {
            var cart = HttpContext.Session.GetString("cart");
            if (cart != null)
            {
                List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);

                for (int i = 0; i < dataCart.Count; i++)
                {
                    if (dataCart[i].Book.Id == id)
                    {
                        dataCart.RemoveAt(i);
                    }
                }
                HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(dataCart));

                return RedirectToAction(nameof(ListCart));
            }
            return RedirectToAction(nameof(Index));
        }

        public IActionResult ListCart()
        {
            var cart = HttpContext.Session.GetString("cart");
            if (cart != null)
            {
                List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);

                if (dataCart.Count > 0)
                {
                    ViewBag.carts = dataCart;
                    return View();
                }
                else
                {
                    return RedirectToAction(nameof(NotFoundCart));
                }
            }

            return RedirectToAction(nameof(NotFoundCart));
        }
        public IActionResult NotFoundBook()
        {
            return View();
        }
        public IActionResult NotFoundCart()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult SuccessfullyOrder()
        {
            return View();
        }

        [Authorize(Roles = "ADMIN, CUS")]
        public async Task<IActionResult> ViewOrder()
        {
            var user = await _userManager.GetUserAsync(User);
            List<Order> userOrders = new List<Order>();

            if (user != null)
            {
                var userId = user.Id;
                userOrders = _db.Order
                    .Include(o => o.OrderItems)
                        .ThenInclude(oi => oi.Book)
                    .Where(o => o.UserId == userId)
                    .ToList();
            }

            return View(userOrders);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}