using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using asm.Models;

namespace asm.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<asm.Models.Book>? Book { get; set; }
        public DbSet<asm.Models.Category>? Category { get; set; }
        public DbSet<asm.Models.Order>? Order { get; set; }
    }
}