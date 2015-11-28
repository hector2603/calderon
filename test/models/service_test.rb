require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
   
   #test "guardar_servicio" do
   	#servicio1 = Service.new({nombre:'servicio1', resumen:'resumen1', descripcion:'descripcion1'})
    #assert servicio1.save
   #end

  test "the truth" do
     assert true
   end

   test "guardar_servicio" do
   	tipo = Type.new({nombre:'TipoPrueba'})
   	tipo.save
   	servicio1 = Service.new({nombre:'servicio1', resumen:'resumen1', descripcion:'descripcion1', type_id: tipo})
   	assert servicio1.save ,'todo está bien'
   end
end
