name "regular_role"
description "Just a regular role; nothing special"

run_list %w{
  recipe[some_recipe]
  recipe[another_recipe]
}

default_attributes :some_attribute => {
  :some_sub_attribute => "some_value",
  :some_other_sub_attribute => "some_other_value"
}
