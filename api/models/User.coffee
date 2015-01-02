User =
  schema: true
  connection: "someMongodbServer"
  attributes:
    name:
      type: "string"

    phone:
      type: "string"

    birthdate:
      type: "date"

    email:
      type: "email"
      unique: true

    passports:
      collection: "Passport"
      via: "user"

module.exports = User