require 'broken_library'

name "library_role"
description "A library role; grabbing data from a library"

run_list %w{
  recipe[some_recipe]
  recipe[another_recipe]
}

default_attributes :some_attribute => {
  :some_sub_attribute => "some_value",
  :some_other_sub_attribute => SomeCompany::SomeLibrary::SomeConstant
}
