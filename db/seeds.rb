AnimalType.create([{ name: 'Perro' },
	               { name: 'Gato' }])

Breed.create([{ name: 'Zaguate', animal_type_id: 1 },
	          { name: 'Dalmata', animal_type_id: 1 }, 
	          { name: 'Siames', animal_type_id: 2 },
	          { name: 'Schnauzer', animal_type_id: 2 }])

Province.create([{ name: 'Alajuela' },
				 { name: 'Cartago' },
				 { name: 'Guanacaste' }, 
				 { name: 'Heredia' }, 
				 { name: 'Limón' },
				 { name: 'Puntarenas' },
				 { name: 'San José' }])