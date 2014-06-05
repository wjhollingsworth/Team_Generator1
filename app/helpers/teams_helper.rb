module TeamsHelper
	def generate_teams
		unassigned_students = []
		Student.all.each do |student|
			unassigned_students.push(student.name)
    	end

    	num_teams = 5   # hardcoding for now

 		team_size = unassigned_students.count / num_teams
 		
 		teams = [ ]

 	until teams.count == num_teams     

    teammates = unassigned_students.sample(team_size) 

     teams.push(teammates)

     teammates.each do |student| 

        unassigned_students.delete(student)
    end
    end
    	unassigned_students.each_with_index do |student, index|

      teams[index].push(student)

   end


    return teams

	end 
end