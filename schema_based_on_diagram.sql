task a
# command for creating medical histories table
- many to one relationship with patients
- one to one relationship with invoices

# command for creating patients table
- one to many relationship with medical histories

# command for creating invoices table
- one to one relationship with medical histories
- one to many relationship with invoice iterms

task B
# command for creating invoice_items table
- many to one relationship with invoices
- many to one relationship with treatments

# command for creating treatments table
- many to many relationship with medical histories
- on to many relationship with invoice_items

# command for creating many to many relationship table between treatments and medical records