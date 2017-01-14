using System;
 
namespace Tastier { 

public class Obj { // properties of declared symbol
   public string name; // its name
   public int kind;    // var, proc, constant, scope or array
   public int type;    // its type if var or constant (undef for proc)
   public int level;   // lexic level: 0 = global; >= 1 local
   public int adr;     // address (displacement) in scope 
   public int isParam; // is the object a parameter (1 yes, 0 no)
   public Obj next;    // ptr to next object in scope
   // for scopes
   public Obj outer;   // ptr to enclosing scope
   public Obj locals;  // ptr to locally declared objects
   public int nextAdr; // next free address in scope
   // for processes
   public int paramCount; // how many parameters the process has
}

public class SymbolTable {

   const int // object kinds
      var = 0, proc = 1, constant = 2, scope = 3, array = 4;

   const int // types
      undef = 0, integer = 1, boolean = 2;

   public Obj topScope; // topmost procedure scope
   public int curLevel; // nesting level of current scope
   public Obj undefObj; // object node for erroneous symbols

   public bool mainPresent;
   
   Parser parser;
   
   public SymbolTable(Parser parser) {
      curLevel = -1; 
      topScope = null;
      undefObj = new Obj();
      undefObj.name = "undef";
      undefObj.kind = var;
      undefObj.type = undef;
      undefObj.level = 0;
      undefObj.adr = 0;
      undefObj.next = null;
      this.parser = parser;
      mainPresent = false;
   }

// open new scope and make it the current scope (topScope)
   public void OpenScope() {
      Obj scop = new Obj();
      scop.name = "";
      scop.kind = scope; 
      scop.outer = topScope; 
      scop.locals = null;
      scop.nextAdr = 0;
      topScope = scop; 
      curLevel++;
   }

// close current scope
   public void CloseScope() {
      Obj p = topScope.locals;
      while (p != null) { 
        String kind;											//String representations of objects' attributes
        String level;
        String type;

        level = p.level==0 ? "global" : "local";

        switch (p.kind)
        {
            case var: kind = "variable";break;
            case proc: kind = "procedure";break;
            case scope: kind = "scope";break;
            case array: kind = "array";break;
            default: kind = "constant";break;
        }

        switch (p.type)
        {
            case undef: type = "undefined type";break;
            case integer: type = "integer";break;
            default: type = "boolean";break;
        }
        //Print out information about each identifier, using the String representations of its attributes.
        Console.WriteLine(";"+p.name+" is a "+level+" "+kind+((p.kind==var || p.kind==constant)? " of type "+type+" at address "+p.adr+"." : "."));
        p = p.next;
      }
      topScope = topScope.outer;
      curLevel--;
   }

// open new sub-scope and make it the current scope (topScope)
   public void OpenSubScope() {
   // lexic level remains unchanged
      Obj scop = new Obj();
      scop.name = "";
      scop.kind = scope;
      scop.outer = topScope;
      scop.locals = null;
   // next available address in stack frame remains unchanged
      scop.nextAdr = topScope.nextAdr;
      topScope = scop;
   }

// close current sub-scope
   public void CloseSubScope() {
      Obj p = topScope.locals;
      while (p != null) { 
        String kind;
        String level;
        String type;

        level = p.level==0 ? "global" : "local";

        switch (p.kind)
        {
            case var: kind = "variable";break;
            case proc: kind = "procedure";break;
            case scope: kind = "scope";break;
            case array: kind = "array";break;
            default: kind = "constant";break;
        }

        switch (p.type)
        {
            case undef: type = "undefined type";break;
            case integer: type = "integer";break;
            default: type = "boolean";break;
        }
        Console.WriteLine(";"+p.name+" is a "+level+" "+kind+((p.kind==var || p.kind==constant)? " of type "+type+" at address "+p.adr+"." : "."));
        p = p.next;
      }
   // lexic level remains unchanged
      topScope = topScope.outer;
   }

// create new object node in current scope
   public Obj NewObj(string name, int kind, int type) {
      Obj p, last; 
      Obj obj = new Obj();
      obj.name = name; obj.kind = kind;
      obj.type = type; obj.level = curLevel; 
      obj.next = null; 
      obj.paramCount = 0;
      obj.outer = topScope;
      obj.isParam = 0;
      p = topScope.locals; last = null;
      while (p != null) { 
         if (p.name == name)
            parser.SemErr("name declared twice");
         last = p; p = p.next;
      }
      if (last == null)
         topScope.locals = obj; else last.next = obj;
      if (kind == var || kind == constant)
         obj.adr = topScope.nextAdr++;
      return obj;
   }
    
    // create new object node of kind array in current scope
   public Obj NewArray(string name, int type, int length) {
      Obj p, last; 
      Obj obj = new Obj();
      obj.name = name; obj.kind = array;
      obj.type = type; obj.level = curLevel; 
      obj.next = null; 
      obj.paramCount = 0;
      obj.isParam = 0;
      obj.outer = topScope;
      p = topScope.locals; last = null;
      while (p != null) { 
         if (p.name == name)
            parser.SemErr("name declared twice");
         last = p; p = p.next;
      }
      if (last == null){
         topScope.locals = obj;
      }
      else{
          last.next = obj;
      }
      obj.adr = topScope.nextAdr+length;
      return obj;
   }

// search for name in open scopes and return its object node
   public Obj Find(string name) {
      Obj obj, scope;
      scope = topScope;
      while (scope != null) { // for all open scopes
         obj = scope.locals;
         while (obj != null) { // for all objects in this scope
            if (obj.name == name) return obj;
            obj = obj.next;
         }
         scope = scope.outer;
      }
      parser.SemErr(name + " is undeclared");
      return undefObj;
   }

} // end SymbolTable

} // end namespace
