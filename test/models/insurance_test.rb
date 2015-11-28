require 'test_helper'

class InsuranceTest < ActiveSupport::TestCase

  test "Guardar seguro" do
  	segurito = Insurance.new({nombre: 'Seguro de Vida', resumen: 'Seguro prestado',  descripcion: 'Seguro prestado'})
  	assert segurito.save ,'Está mal'
  end

  test "Guardar Sin nombre " do
  	segurito2 = Insurance.new({resumen:'seguro prestado',descripcion:'seguro prestado'})
  	assert_not segurito2.save,'Está mal, falta el nombre'
  end

  test "Guardar sin resumen" do
  	segurito3 = Insurance.new({nombre: 'Seguro de Vida',descripcion:'seguro prestado'})
  	assert_not segurito3.save,'Está mal, falta el resumen'
  end

  test "Guardar sin descripcion" do
  	segurito4 = Insurance.new({nombre: 'Seguro de Vida', resumen: 'Seguro prestado'})
  	assert_not segurito4.save ,'Está mal, falta la descripción'
  end

  test "Guardar con nombre largo" do
  	segurito = Insurance.new({nombre: 'Seguro de Vida con nombre innecesariamente largo', resumen: 'Seguro prestado',  descripcion: 'Seguro prestado'})
  	assert_not segurito.save ,'Está mal, nombre muy largo'
  end

  test "Guardar con resumen largo" do
  	segurito = Insurance.new({nombre: 'Seguro de Vida ', resumen: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui dicta minus molestiae vel beatae natus eveniet ratione temporibus aperiam harum alias officiis assumenda officia quibusdam deleniti eos cupiditate dolore doloribus!
																	Ad dolore dignissimos asperiores dicta facere optio quod commodi nam tempore recusandae. Rerum sed nulla eum vero expedita ex delectus voluptates rem at neque quos facere sequi unde optio aliquam!
																	Tenetur quod quidem in voluptatem corporis dolorum dicta sit pariatur porro quaerat autem ipsam odit quam beatae tempora quibusdam illum! Modi velit odio nam nulla unde amet odit pariatur at!
																	Consequatur rerum amet fuga expedita sunt et tempora saepe? Iusto nihil explicabo perferendis quos provident delectus ducimus necessitatibus reiciendis optio tempora unde earum doloremque commodi laudantium ad nulla vel odio?
																	Tenetur quod quidem in voluptatem corporis dolorum dicta sit pariatur porro quaerat autem ipsam odit quam beatae tempora quibusdam illum! Modi velit odio nam nulla unde amet odit pariatur at!
																	Consequatur rerum amet fuga expedita sunt et tempora saepe? Iusto nihil explicabo perferendis quos provident delectus ducimus necessitatibus reiciendis optio tempora unde earum doloremque commodi laudantium ad nulla vel odio?',  descripcion: 'Seguro prestado'})
  	assert_not segurito.save ,'Está mal, resumen muy largo'
  end

  test "Guardar con descripcion larga" do
  	segurito = Insurance.new({nombre: 'Seguro de Vida ', descripcion: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui dicta minus molestiae vel beatae natus eveniet ratione temporibus aperiam harum alias officiis assumenda officia quibusdam deleniti eos cupiditate dolore doloribus!
																	Ad dolore dignissimos asperiores dicta facere optio quod commodi nam tempore recusandae. Rerum sed nulla eum vero expedita ex delectus voluptates rem at neque quos facere sequi unde optio aliquam!
																	Tenetur quod quidem in voluptatem corporis dolorum dicta sit pariatur porro quaerat autem ipsam odit quam beatae tempora quibusdam illum! Modi velit odio nam nulla unde amet odit pariatur at!
																	Consequatur rerum amet fuga expedita sunt et tempora saepe? Iusto nihil explicabo perferendis quos provident delectus ducimus necessitatibus reiciendis optio tempora unde earum doloremque commodi laudantium ad nulla vel odio?
																	Tenetur quod quidem in voluptatem corporis dolorum dicta sit pariatur porro quaerat autem ipsam odit quam beatae tempora quibusdam illum! Modi velit odio nam nulla unde amet odit pariatur at!
																	Consequatur rerum amet fuga expedita sunt et tempora saepe? Iusto nihil explicabo perferendis quos provident delectus ducimus necessitatibus reiciendis optio tempora unde earum doloremque commodi laudantium ad nulla vel odio?',  resumen: 'Seguro prestado'})
  	assert_not segurito.save ,'Está mal, descripcion muy larga'
  end

  test "Guardar seguro vacio" do
  	segurito = Insurance.new()
  	assert_not segurito.save ,'Está mal, no puede ser vacio'
  end

end
