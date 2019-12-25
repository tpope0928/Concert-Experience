the code below is the beginning code to show users experience for selected concert

<td><%= link_to "Your Experience", concert_experience_path(c.id, @experiences) %>

Errors to fix:
    1. Your Experience
    2. Select artist drop down is blank when created