Given("there are grades in the gradebook") do
    @teacher = create(:user, :teacher)
    @ta = create(:user, :ta)
    @eric = create(:grade, :valid)
    @tomai = create(:grade, :valid)
    @schweller = create(:grade, :valid)
    @wylie = create(:grade, :valid)
end

Given("there are grades with sortable values in the gradebook") do
    @teacher = create(:user, :teacher)
    @ta = create(:user, :ta)
    @grade1 = create(:grade, student_name: "Charly", student_grade: 70)
    @grade2 = create(:grade, student_name: "Danny", student_grade: 60)
    @grade3 = create(:grade, student_name: "Amy", student_grade: 90)
    @grade4 = create(:grade, student_name: "Billy", student_grade: 80)
end

Given("I sign in as a teacher") do
    visit new_user_session_path
    fill_in "user_email", with: @teacher.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
end

Given("I sign in as a ta") do
    visit new_user_session_path
    fill_in "user_email", with: @ta.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
end

When("I visit the homepage") do
    visit root_path
end

Then ("I click on a user's name") do
    click_on @eric.student_name
end

When("I click {string}") do |string|
    click_on string
end

When("I fill out the form and submit") do
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 80
    click_on "Create Grade"
end

Then("I should have added a grade") do
    expect(page).to have_content("Grade was successfully created.")
end

Then("that post should be deleted") do
    expect(page).to have_content("Grade was successfully destroyed.")
end

Then("I should see everyone's grades") do
    @grades = Grade.all
    @grades.each do |g|
        expect(page.body).to include(g.student_id)
    end
end


Then("I should see that user's detailed grade information") do
    expect(page).to have_content(@eric.student_id)
    expect(page).to have_content(@eric.student_name)
    expect(page).to have_content(@eric.student_grade)
end

When("I click {string} on a post") do |string|
    click_on string, :match => :first
end

Then("I should see everyone's grades in ascending order") do
    within(:xpath, "//table/tbody/tr[1]") do
        expect(page).to have_content("Danny 60")
    end
    within(:xpath, "//table/tbody/tr[2]") do
        expect(page).to have_content("Charly 70")
    end
    within(:xpath, "//table/tbody/tr[3]") do
        expect(page).to have_content("Billy 80")
    end
    within(:xpath, "//table/tbody/tr[4]") do
        expect(page).to have_content("Amy 90")
    end
    

end
  
Then("I should see everyone's grades in descending order") do
    within(:xpath, "//table/tbody/tr[1]") do
        expect(page).to have_content("Amy 90")
    end
    within(:xpath, "//table/tbody/tr[2]") do
        expect(page).to have_content("Billy 80")
    end
    within(:xpath, "//table/tbody/tr[3]") do
        expect(page).to have_content("Charly 70")
    end
    within(:xpath, "//table/tbody/tr[4]") do
        expect(page).to have_content("Danny 60")
    end
end