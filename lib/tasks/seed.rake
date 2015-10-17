def require_factories
  require "factory_girl_rails"
end

namespace :seed do
  desc "Seed admin user"
  task admin: :environment do
    AdminUser.where(email: 'admin@example.com').first_or_create do |admin|
      admin.password = 'adminpass'
    end
  end

  desc "Seed dog/cat breeds"
  task breeds: :environment do
    Rake::Task['seed:dog_breeds'].invoke
    Rake::Task['seed:cat_breeds'].invoke
  end

  desc "Seed all dog breeds"
  task dog_breeds: :environment do
    DOG_BREEDS = [
      'Zaguate', 'Otra', 'Dálmata',
      'Beagle', 'Bóxer', 'Braco',
      'Bull Terrier', 'Bulldog', 'Chihuahueño',
      'Chow chow', 'Cocker spaniel', 'Dobermann',
      'Fox Terrier', 'Galgo', 'Golden retriever',
      'Gran danés', 'Husky siberiano', 'Labrador',
      'Mastín', 'Maltés', 'Pastor alemán',
      'Pekinés', 'Perro de agua', 'Pinscher alemán',
      'Pinscher miniatura', 'Pitbull', 'Podenco',
      'Pug', 'Puli', 'Ratonero', 'Rottweiler',
      'San Bernardo', 'Schnauzer', 'Siberian husky',
      'Terrier'
    ].freeze

    dog_type = AnimalType.where(name: 'Perro').first_or_create

    DOG_BREEDS.each do |breed|
      Breed.where(name: breed, animal_type: dog_type).first_or_create
    end
  end

  desc "Seed all cat breeds"
  task cat_breeds: :environment do
    CAT_BREEDS = [
      'Mestizo', 'Otra', 'Siamés',
      'Siberiano', 'Oriental', 'Europeo Común',
      'Abisinio', 'Azul ruso', 'Angora turco',
      'Africano doméstico', 'American', 'Bengala',
      'Dorado africano', 'Persa', 'Himalayo'
    ].freeze

    cat_type = AnimalType.where(name: 'Gato').first_or_create

    CAT_BREEDS.each do |breed|
      Breed.where(name: breed, animal_type: cat_type).first_or_create
    end
  end

  desc "Seed Costa Rica provinces"
  task provinces: :environment do
    PROVINCES = [
      'Alajuela', 'Cartago', 'Guanacaste',
      'Heredia', 'Limón', 'Puntarenas',
      'San José'
    ].freeze

    PROVINCES.each { |province| Province.where(name: province).first_or_create }
  end

  task lost_pets: :environment do
    require_factories

    15.times do
      FactoryGirl.create :lost_report,
        pet: FactoryGirl.create(:pet, breed: Breed.all.sample),
        province: Province.all.sample
    end
  end
end
