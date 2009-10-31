using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios
{
    public class RepoGenerico<T> where T: class
    {
        sigsetEntities ent = new sigsetEntities();
        public IQueryable<T> GetAll()
        {
            return ent.GetTable<T>();
        }
    }
}
