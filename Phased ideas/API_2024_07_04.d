
interface Backend{
	
}

interface View{
	@property View body();
	ViewImpl getImpl(Backend backend);
	void update(ViewImpl view, Backend backend);
}

interface ViewModifier{
	@property View body();
	ViewImpl getImpl(Backend backend);
	void update(ViewImpl view, Backend backend);
}
