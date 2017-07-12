require 'rails_helper'

RSpec.feature "Animals", type: :feature do
  context "Landing page" do
   Steps "Going to Landing page" do
     Given "I visit localhost 3000:" do
       visit "/"
     end
     Then "I see Animals" do
       expect(page).to have_content("Animals")
     end
   end
 end

 context "Create an animal" do
    Steps "for creating an animal" do
      Given "that I am on the Animal page" do
        visit "/"
      end
       Then "I can click on create animal" do
        click_link 'New Animal'
       end
      Then 'I am taken to a page where I can create an animal' do
        expect(page).to have_content 'New Animal'
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then 'I see my animal' do
        expect(page).to have_content("Animal was successfully created.")
        expect(page).to have_content("Tiger")
        expect(page).to have_content("Feline")
        expect(page).to have_content("Mammal")
      end
    end
  end

  context "See all animals in database" do
    Steps "for seeing a list of animals" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can click back to make another animal" do
        click_link 'Back'
        click_link 'New Animal'
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Crocodile'
        fill_in 'Latin name', with: 'Croc'
        fill_in 'Kingdom', with: 'Reptile'
        click_button 'Create Animal'
      end
      Then "I can see my animals in a list" do
        click_link 'Back'
        expect(page).to have_content("Tiger Feline Mammal")
        expect(page).to have_content("Crocodile Croc Reptile")
      end
    end
  end

  context "Update an animal in database" do
    Steps "for updating an animal" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Laksdjfla'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can edit the animal" do
        click_link 'Edit'
        fill_in 'Common name', with: 'Tiger'
        click_button 'Update Animal'
      end
      Then "I can see the updated animal" do
        expect(page).to have_content("Animal was successfully updated.")
        expect(page).to have_content("Tiger")
      end
    end
  end

  context "Destroy an animal in database" do
    Steps "for destroying an animal" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can destroy the animal" do
        click_link 'Back'
        click_link 'Destroy'

      end
      Then "I can no longer see the animal" do
        expect(page).to have_no_content("Tiger Feline Mammal")
      end
    end
  end

  context "Add a sighting of an animal" do
    Steps "for adding a sighting of an animal" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can add a sighting" do
        click_link 'New Sighting'
        select '2017', from: 'sighting_date_1i'
        select 'June', from: 'sighting_date_2i'
        select '13', from: 'sighting_date_3i'
        select '18', from: 'sighting_time_4i'
        select '00', from: 'sighting_time_5i'
        fill_in 'Latitude', with: '50'
        fill_in 'Longitude', with: '50'
        select 'South', from: 'sighting_region'
        click_button 'Create Sighting'
      end
      Then "A sighting is added" do
        expect(page).to have_content("Sighting was successfully created.")
        expect(page).to have_content("2017-06-13")
        expect(page).to have_content("2000-01-01 18:00:00")
        expect(page).to have_content("Latitude: 50")
        expect(page).to have_content("Longitude: 50")
        expect(page).to have_content("South")
        expect(page).to have_content("Tiger")
      end
    end
  end

  context "Edit a sighting of an animal" do
    Steps "for editing a sighting of an animal" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can add a sighting" do
        click_link 'New Sighting'
        select '2017', from: 'sighting_date_1i'
        select 'June', from: 'sighting_date_2i'
        select '13', from: 'sighting_date_3i'
        select '18', from: 'sighting_time_4i'
        select '00', from: 'sighting_time_5i'
        fill_in 'Latitude', with: '50'
        fill_in 'Longitude', with: '50'
        select 'South', from: 'sighting_region'
        click_button 'Create Sighting'
      end
      Then "I can edit a sighting" do
        click_link 'Edit'
        fill_in 'Latitude', with: '100'
        click_button 'Update Sighting'
      end
      Then 'I can see my updates' do
        expect(page).to have_content("Sighting was successfully updated.")
        expect(page).to have_content("Latitude: 100")
      end
    end
  end

  context "Delete a sighting of an animal" do
    Steps "for deleting a sighting of an animal" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can add a sighting" do
        click_link 'New Sighting'
        select '2017', from: 'sighting_date_1i'
        select 'June', from: 'sighting_date_2i'
        select '13', from: 'sighting_date_3i'
        select '18', from: 'sighting_time_4i'
        select '00', from: 'sighting_time_5i'
        fill_in 'Latitude', with: '50'
        fill_in 'Longitude', with: '50'
        select 'South', from: 'sighting_region'
        click_button 'Create Sighting'
      end
      Then "I can delete a sighting" do
        click_link 'Back'
        click_link 'Destroy'
      end
      Then "I can no longer see the sighting" do
        expect(page).to have_no_content("2017-06-13 18:00 50 50 South Tiger")
      end
    end
  end

  context "Show sightings for an animal" do
    Steps "for showing sightings of an animal" do
      Given "that I am on the new animal page" do
        visit "/animals/new"
      end
      Then "I can create an animal" do
        fill_in 'Common name', with: 'Tiger'
        fill_in 'Latin name', with: 'Feline'
        fill_in 'Kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then "I can add a sighting" do
        click_link 'New Sighting'
        select '2017', from: 'sighting_date_1i'
        select 'June', from: 'sighting_date_2i'
        select '13', from: 'sighting_date_3i'
        select '18', from: 'sighting_time_4i'
        select '00', from: 'sighting_time_5i'
        fill_in 'Latitude', with: '50'
        fill_in 'Longitude', with: '50'
        select 'South', from: 'sighting_region'
        click_button 'Create Sighting'
      end
      Then "I can view the sightings for an animal" do
        visit "/"
        click_link 'Show'
        expect(page).to have_content("2000-01-01 18:00:00 UTC 2017-06-13")
      end
    end 
  end


end

#
# fill_in 'name', with: 'Don Ready'
# fill_in 'email', with: 'DonReady@hotmail.com'
