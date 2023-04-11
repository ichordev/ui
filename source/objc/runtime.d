module objc.runtime;

version(D_ObjectiveC){
	public import core.attribute: optional, selector;
}

struct Block(RetT, Args...){
	void* isa;
	int flags;
	int reserved;
	RetT function(void*, Args) invoke;
}

struct objc_ivar;
alias Ivar = objc_ivar*;

struct objc_selector;
alias SEL = objc_selector*;

struct objc_class;
alias Class = objc_class*;

struct objc_object;
alias id = objc_object*; //alias id = NSObject;

struct objc_super{
	id reciever;
	Class super_class;
}

alias IMP = id function(id, SEL, ...);
struct objc_method;
alias Method = objc_method*;

struct objc_method_description{
	SEL name;
	char* types;
}

alias objc_property_t = void*;

version(D_ObjectiveC){
	extern(Objective-C) class Protocol;
}else{
	struct objc_protocol;
	alias Protocol = objc_protocol*;
}

enum nil = cast(id)null;

enum Nil = cast(Class)null;

extern(C) nothrow @nogc{
	bool class_addIvar(Class cls, const(char)* name, size_t size, ubyte alignment, const(char)* types);
	bool class_addMethod(Class cls, SEL name, IMP imp, const(char)* types);
	bool class_addProtocol(Class cls, Protocol* protocol);
	bool class_conformsToProtocol(Class cls, Protocol* protocol);
	Ivar* class_copyIvarList(Class cls, uint* outCount);
	Method* class_copyMethodList(Class cls, uint* outCount);
	objc_property_t* class_copyPropertyList(Class cls, uint* outCount);
	Protocol** class_copyProtocolList(Class cls, uint* outCount);
	id class_createInstance(Class cls, size_t extraBytes);
	Method class_getClassMethod(Class aClass, SEL aSelector);
	Ivar class_getClassVariable(Class cls, const(char)* name);
	Method class_getInstanceMethod(Class aClass, SEL aSelector);
	size_t class_getInstanceSize(Class cls);
	Ivar class_getInstanceVariable(Class cls, const(char)* name);
	const(char)* class_getIvarLayout(Class cls);
	IMP class_getMethodImplementation(Class cls, SEL name);
	IMP class_getMethodImplementation_stret(Class cls, SEL name);
	const(char)* class_getName(Class cls);
	objc_property_t class_getProperty(Class cls, const(char)* name);
	Class class_getSuperclass(Class cls);
	int class_getVersion(Class theClass);
	const(char)* class_getWeakIvarLayout(Class cls);
	bool class_isMetaClass(Class cls);
	IMP class_replaceMethod(Class cls, SEL name, IMP imp, const(char)* types);
	bool class_respondsToSelector(Class cls, SEL sel);
	void class_setIvarLayout(Class cls, const(char)* layout);
	void class_setVersion(Class theClass, int version_);
	void class_setWeakIvarLayout(Class cls, const(char)* layout);
	const(char)* ivar_getName(Ivar ivar);
	ptrdiff_t ivar_getOffset(Ivar ivar);
	const(char)* ivar_getTypeEncoding(Ivar ivar);
	char* method_copyArgumentType(Method method, uint index);
	char* method_copyReturnType(Method method);
	void method_exchangeImplementations(Method m1, Method m2);
	void method_getArgumentType(Method method, uint index, char* dst, size_t dst_len);
	IMP method_getImplementation(Method method);
	SEL method_getName(Method method);
	uint method_getNumberOfArguments(Method method);
	void method_getReturnType(Method method, char* dst, size_t dst_len);
	const(char)* method_getTypeEncoding(Method method);
	IMP method_setImplementation(Method method, IMP imp);
	Class objc_allocateClassPair(Class superclass, const(char)* name, size_t extraBytes);
	Class objc_allocateMetaClass(Class superclass, size_t extraBytes);
	void objc_disposeClassPair(Class cls);
	id objc_getClass(const(char)* name);
	int objc_getClassList(Class* buffer, int bufferLen);
	id objc_getMetaClass(const(char)* name);
	id objc_getRequiredClass(const(char)* name);
	id objc_lookUpClass(const(char)* name);
	Class objc_allocateClassPair(Class superclass, const(char)* name, size_t extraBytes);
	Protocol* objc_getProtocol(const(char)* name);
	void objc_registerClassPair(Class cls);
	void* object_getIndexedIvars(id obj);
	id object_dispose(id obj);
	Class object_getClass(id obj);
	Class object_setClass(id obj, Class cls);
	const(char)* object_getClassName(id obj);
	Protocol** objc_copyProtocolList(uint* count);
	bool protocol_conformsToProtocol(Protocol* p, Protocol* other);
	objc_method_description* protocol_copyMethodDescriptionList(Protocol* p, bool isRequiredMethod, bool isInstanceMethod, uint* count);
	objc_property_t* protocol_copyPropertyList(Protocol* p, uint* count);
	Protocol** protocol_copyProtocolList(Protocol* p, uint* count);
	objc_method_description protocol_getMethodDescription(Protocol* p, SEL aSel, bool isRequiredMethod, bool isInstanceMethod);
	const(char)* protocol_getName(Protocol* p);
	objc_property_t protocol_getProperty(Protocol* p, const(char)* name, bool isRequiredProperty, bool isInstanceProperty);
	bool protocol_isEqual(Protocol* p, Protocol* other);
	void objc_msgSend(Class theReceiver, SEL theSelector, ...);
	void objc_msgSendSuper(objc_super* super_, SEL op, ...);
	const(char)* sel_getName(SEL sel);
	SEL sel_getUid(const(char)* selName);
	bool sel_isEqual(SEL sel1, SEL sel2);
	SEL sel_registerName(const(char)* selName);
}
