// OpenDialog Demo
//
// This macro demonstrates how do use the 
// File.openDialog() macro function.

  path_to_BF = File.openDialog("Select a bright field image");
  open(path_to_BF); // open the file

  BF_name = File.getName(path_to_BF);
  BF_id = getImageID();
  selectImage(BF_id);

// set scale according to pixel dimensions
  run("Properties...", "channels=1 slices=1 frames=1 unit=micron pixel_width=0.156911 pixel_height=0.156911 voxel_depth=0.156911");

// despeckle to remove noise
  run("Despeckle");

  n = getNumber("Enter desired number of duplications",249);
 	setBatchMode(true); 
 	stack = getImageID() 
 	for (i=1; i<n; i++) { 
    	run("Duplicate...", "title=temp"); 
    	run("Copy"); 
    	selectImage(stack); 
    	run("Add Slice"); 
    	run("Paste"); 
 	} 
 	setSlice(1); 
 	run("Select None"); 
 	setBatchMode(false);

// now for GFP
  path_to_GFP = File.openDialog("Select a GFP stack");
  open(path_to_GFP); // open the file

  GFP_id = getImageID();
  selectImage(GFP_id);

  GFP_name = File.getName(path_to_GFP);
  run("Apply LUT", "stack");
  run("Brightness/Contrast...");

  run("Merge Channels...", "c2=" + GFP_name + " c4=" + BF_name + " create keep");