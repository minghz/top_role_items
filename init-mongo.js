db.meta.insert({type: "initialize database"})

db.createUser(
  {
    user: "root",
    pwd: "rootpassword",
    roles: [
      {
        role: "dbOwner",
        db: "top_role_items_db"
      }
    ]
  }
)
