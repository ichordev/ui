
struct View{
	View delegate(ref View self) body; //returns the contents of the view
	
	void delegate(ref View self) implOnCreate; ///implementation-defined behaviour on creation
	void delegate(ref View self) implOnUpdate; ///implementation-defined behaviour on update
	void delegate(ref View self) implOnRemove; ///implementation-defined behaviour on removal
	
	float alpha = 1f;
	uint x, y;
	uint w, h;
	
	void[] data;
}

//factories
View uiButton(){
	return View(
		implOnCreate: (ref View self){
			//stuff
		},
		implOnUpdate: (ref View self){
			//stuff
		},
		implOnRemove: (ref View self){
			//stuff
		},
	);
}

//custom modifiers
View alpha(ref View view, float val){
	view.alpha = val;
	return view;
}
