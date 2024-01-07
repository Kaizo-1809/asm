using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using asm.Data;
using asm.Models;
using Microsoft.AspNetCore.Authorization;
using static System.Reflection.Metadata.BlobBuilder;

namespace asm.Controllers
{
    public class BooksController : Controller
    {
        private readonly ApplicationDbContext _db;
        private readonly IWebHostEnvironment webHostEnvironment;

        public BooksController(ApplicationDbContext db, IWebHostEnvironment webHostEnvironment)
        {
            this._db = db;
            this.webHostEnvironment = webHostEnvironment;
        }

        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _db.Book.Include(b => b.Category);
            return View(await applicationDbContext.ToListAsync());
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

        [Authorize(Roles = "ADMIN")]
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_db.Category, "Id", "Name");
            return View();
        }

        // POST: ProductsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Book model)
        {
            if (ModelState.IsValid)
            {
                string uniqueFileName = UploadedFile(model);
                Book book = new Book
                {
                    Title = model.Title,
                    Detail = model.Detail,
                    CategoryId = model.CategoryId,
                    Price = model.Price,
                    Picture = uniqueFileName,
                };
                _db.Add(book);
                await _db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            };
            ViewData["CategoryId"] = new SelectList(_db.Category, "Id", "Name", model.CategoryId);
            return View();
        }

        [Authorize(Roles = "ADMIN")]
        public IActionResult Edit(int id)
        {
            var book = _db.Book.Find(id);

            if (book == null)
            {
                return NotFound();
            }

            var bookEdit = new Book
            {
                Title = book.Title,
                Detail = book.Detail,
                CategoryId = book.CategoryId,
                Price = book.Price,
            };
            ViewData["CategoryId"] = new SelectList(_db.Category, "Id", "Name", bookEdit.CategoryId);
            return View(bookEdit);
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Book model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var book = await _db.Book.FindAsync(id);

                    if (book == null)
                    {
                        return NotFound();
                    }

                    if (!string.IsNullOrEmpty(book.Picture))
                    {
                        var oldImagePath = Path.Combine(webHostEnvironment.WebRootPath, "images", book.Picture);
                        if (System.IO.File.Exists(oldImagePath))
                        {
                            System.IO.File.Delete(oldImagePath);
                        }
                    }
                    string uniqueFileName = UploadedFile(model);

                    book.Title = model.Title;
                    book.Detail = model.Detail;
                    book.CategoryId = model.CategoryId;
                    book.Price = model.Price;
                    book.Picture = uniqueFileName;

                    await _db.SaveChangesAsync();

                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error in Edit action: {ex.Message}");
                    return View(model);
                }
            }
            ViewData["CategoryId"] = new SelectList(_db.Category, "Id", "Name", model.CategoryId);
            return View(model);
        }

        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> Delete(int id)
        {
            var book = await _db.Book.FindAsync(id);

            if (book == null)
            {
                return NotFound();
            }

            return View(book);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var book = await _db.Book.FindAsync(id);
                if (book == null)
                {
                    return NotFound();
                }
                if (!string.IsNullOrEmpty(book.Picture))
                {
                    var imagePath = Path.Combine(webHostEnvironment.WebRootPath, "images", book.Picture);
                    if (System.IO.File.Exists(imagePath))
                    {
                        System.IO.File.Delete(imagePath);
                    }
                }
                _db.Book.Remove(book);
                await _db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in DeleteConfirmed action: {ex.Message}");
                TempData["ErrorMessage"] = "Error deleting product.";
                return RedirectToAction(nameof(Index));
            }
        }


        private string UploadedFile(Book model)
        {
            string uniqueFileName = null;
            if (model.Image != null)
            {
                string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, "images");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Image.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.Image.CopyTo(fileStream);
                }
            }
            return uniqueFileName;
        }
    }
}
