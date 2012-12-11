# -*- encoding : utf-8 -*-
class Pessoa
  include MongoMapper::Document

  key :nome, String
  key :email, String

end
