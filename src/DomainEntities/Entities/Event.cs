﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainEntities
{
    public class Event
    {
        public Event(int id, string name, string description, int layoutId)
        {
            Id = id;
            Name = name;
            Description = description;
            LayoutId = layoutId;
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public int LayoutId { get; set; }
    }
}