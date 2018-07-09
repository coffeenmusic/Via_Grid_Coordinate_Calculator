' Select Component Ground Pad To Add Stitching Vias To

' Enter X and Y center coordinates that Via Grid will center to
center_x = 2387.01mil
center_y = 5891.72mil

' Spacing and Dimension Options Are Optional Changes. Default spacing=50mil, dims=2
spacing = 50mil
dims = 2 ' Example: 2 = 4 Vias (2 rows, 2 cols)

Application.ExecuteCommand("Select Net")
Application.ExecuteCommand("Add Free Via")
DlgYesNoCheckQuestion.Question("Adding shielding or stitching vias with DRC not in Prevent mode may result in clearance violations.Do you want to continue?").Answer(mbYes)

min_x = center_x - 0.5*(dims-1)*spacing
min_y = center_y - 0.5*(dims-1)*spacing

For x=0 to dims-1
	For y=0 to dims-1
		MainView.MouseMove(min_x + x*spacing, min_y + y*spacing)
		Application.ExecuteCommand("Complete Move", min_x + x*spacing, min_y + y*spacing)
	Next y
Next x
MainView.MouseMove(center_x, center_y)
Application.ExecuteCommand("Cancel")
