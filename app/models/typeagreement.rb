class Typeagreement < ActiveRecord::Base
validates :denominacion, uniqueness: {message: "La denominación que quiere insertar ya existe"}
end
