// File generated by Gambit v4.9.3
// Link info: (409003 (js ()) "exo01_" (("exo01")) (nargs wrong_nargs pollcount poll ffi r1 r0 stack sp string make_interned_symbol peps glo module_register modlinkinfo module_registry_init) (exo01) (button-click-set! ##vm-main-module-ref main ##program-descr body-append document.write exo01#) () #f)

var g_glo = {};

function g_host_function2scm(obj) {
  function g_h2s_procedure() {
    return g_scm2host_call(obj);
  }

  return g_h2s_procedure;
}

function G_ModLinkInfo(name,index) {
  this.name = name;
  this.index = index;
}

var g_module_count = 0;

var g_module_map = {};

var g_module_table = null;

var g_nargs = 0;

var g_peps = {};

var g_pollcount = 100;

function G_ScmObj() {
}

var g_stack = [];

function g_str2codes(strng) {

      var codes = [];
      for (var i=0; i < strng.length; i++) {
          codes.push(strng.charCodeAt(i));
      }
      return codes;
}

function g_str_hash(strng) {
  var h = 18652613;
  var i = 0;
  var leng = strng.length;
  while (i < leng) {
    h = ((h ^ strng.charCodeAt(i)) * 16777619) & 536870911;
    ++i;
  }
  return h;
}

var g_symbol_table = {};

function G_F32Vector(elems) {
  this.elems = elems;
}

function G_F64Vector(elems) {
  this.elems = elems;
}

function G_Flonum(val) {
  this.val = val;
}

G_Flonum.prototype.toString = function () {
  return this.val.toString();
};

function G_Jumpable() {
}

G_Jumpable.prototype.jump = function () {};

function g_module_registry_init(link_info) {
  var n = link_info.length;
  var i = 0;
  g_module_table = new Array(n);
  while (i < n) {
    var info = link_info[i];
    g_module_map[info.name] = info;
    g_module_table[i] = null;
    ++i;
  }
}

function G_Pair(car,cdr) {
  this.car = car;
  this.cdr = cdr;
}

var g_r0 = void 0;

var g_r1 = void 0;

var g_r2 = void 0;

var g_r3 = void 0;

function G_S16Vector(elems) {
  this.elems = elems;
}

function G_S32Vector(elems) {
  this.elems = elems;
}

function G_S8Vector(elems) {
  this.elems = elems;
}

function g_scm_procedure2host(obj) {
  function scm_procedure() {
    var args = Array.prototype.slice.call(arguments);
    return g_host2scm_call(obj,args);
  }
  return scm_procedure;
}

var g_sp = -1;

function G_ScmString(codes) {
  this.codes = codes;
}

G_ScmString.prototype.toString = function () {
  var limit = 32768;
  if (this.codes.length < limit) {
    return String.fromCharCode.apply(null,this.codes);
  } else {
    var chunks = [];
    var i = 0;
    while (i < this.codes.length) {
      chunks.push(String.fromCharCode.apply(null,this.codes.slice(i,i + limit)));
      i += limit;
    }
    return chunks.join("");
  }
};

function G_Structure(slots) {
  this.slots = slots;
  if (slots[0] === null) {
    this.slots[0] = this;
  }
}

function G_Symbol(name,hash,interned) {
  this.name = name;
  this.hash = hash;
  this.interned = interned;
}

G_Symbol.prototype.toString = function () {
  return this.name;
};

function G_U16Vector(elems) {
  this.elems = elems;
}

function G_U32Vector(elems) {
  this.elems = elems;
}

function G_U8Vector(elems) {
  this.elems = elems;
}

function G_ControlPoint(id,parent) {
  this.id = id;
  this.parent = parent;
}

G_ControlPoint.prototype = Object.create(G_Jumpable.prototype);

function g_host2scm(obj) {
  if (obj === void 0) {
    return void 0;
  }
  if (obj === null) {
    return null;
  }
  if (typeof obj === "boolean") {
    return obj;
  }
  if (typeof obj === "number") {
    if ((obj | 0) === obj && obj >= -536870912 && obj <= 536870911) {
      return obj;
    } else {
      return new G_Flonum(obj);
    }
  }
  if (typeof obj === "function") {
    return g_host_function2scm(obj);
  }
  if (typeof obj === "string") {
    return new G_ScmString(g_str2codes(obj));
  }
  if (typeof obj === "object") {
    if (obj instanceof Array) {
      return obj.map( g_host2scm );
    }
    if (obj instanceof Uint8Array) {
      return new G_U8Vector(obj);
    }
    if (obj instanceof Uint16Array) {
      return new G_U16Vector(obj);
    }
    if (obj instanceof Uint32Array) {
      return new G_U32Vector(obj);
    }
    if (obj instanceof Int8Array) {
      return new G_S8Vector(obj);
    }
    if (obj instanceof Int16Array) {
      return new G_S16Vector(obj);
    }
    if (obj instanceof Int32Array) {
      return new G_S32Vector(obj);
    }
    if (obj instanceof Float32Array) {
      return new G_F32Vector(obj);
    }
    if (obj instanceof Float64Array) {
      return new G_F64Vector(obj);
    }
    var alist = null;
    for (var key in obj) {
    alist = new G_Pair(new G_Pair(g_host2scm(key),g_host2scm(obj[key])),alist);
    }
    return alist;
  }
  throw "host2scm error";
}

function g_make_interned_symbol(name) {
  var obj = Object.prototype.hasOwnProperty.call(g_symbol_table,name) ? g_symbol_table[name] : null;
  if (obj === null) {
    obj = new G_Symbol(name,g_str_hash(name),false);
    obj.interned = true;
    g_symbol_table[name] = obj;
  }
  return obj;
}

function g_scm2host(obj) {
  if (obj === void 0) {
    return obj;
  }
  if (obj === null) {
    return obj;
  }
  if (typeof obj === "boolean") {
    return obj;
  }
  if (typeof obj === "number") {
    return obj;
  }
  if (obj instanceof G_Flonum) {
    return obj.val;
  }
  if (obj instanceof G_ScmString) {
    return obj.toString();
  }
  if (obj instanceof Array) {
    return obj.map( g_scm2host );
  }
  if (obj instanceof G_U8Vector) {
    return obj.elems;
  }
  if (obj instanceof G_U16Vector) {
    return obj.elems;
  }
  if (obj instanceof G_U32Vector) {
    return obj.elems;
  }
  if (obj instanceof G_S8Vector) {
    return obj.elems;
  }
  if (obj instanceof G_S16Vector) {
    return obj.elems;
  }
  if (obj instanceof G_S32Vector) {
    return obj.elems;
  }
  if (obj instanceof G_F32Vector) {
    return obj.elems;
  }
  if (obj instanceof G_F64Vector) {
    return obj.elems;
  }
  if (obj instanceof G_Pair) {
    var jsobj = {};
    var i = 0;
    while (obj instanceof G_Pair) {
      var elem = obj.car;
      if (elem instanceof G_Pair) {
        jsobj[g_scm2host(elem.car)] = g_scm2host(elem.cdr);
      } else {
        jsobj[i] = g_scm2host(elem);
      }
      ++i;
      obj = obj.cdr;
    }
    return jsobj;
  }
  if (obj instanceof G_Structure) {
    throw "scm2host error (cannot convert Structure)";
  }
  if (typeof obj === "function") {
    return g_scm_procedure2host(obj);
  }
  throw "scm2host error";
}

function g_trampoline(pc) {
  while (pc !== null) {
    pc = pc();
  }
}

function g_underflow() {
  var nextf = g_stack[0];
  if (nextf === void 0) {
    return null;
  }
  var frame = nextf;
  var ra = frame[0];
  var fs = ra.fs;
  var link = ra.link;
  g_stack = frame.slice(0,fs + 1);
  g_sp = fs;
  g_stack[0] = frame[link];
  g_stack[link] = g_underflow;
  return ra;
}

g_underflow.id = 0;
g_underflow.parent = null;
g_underflow.fs = 0;
g_underflow.link = 0;

function G_EntryPoint(id,parent,nfree) {
  this.id = id;
  this.parent = parent;
  this.nfree = nfree;
}

G_EntryPoint.prototype = Object.create(G_ControlPoint.prototype);

function g_module_register(module_descr) {
  var temp = module_descr[0];
  var name = temp[temp.length - 1].name;
  var info = Object.prototype.hasOwnProperty.call(g_module_map,name) ? g_module_map[name] : null;
  if (info === null) {
    g_sp = -1;
    g_stack[++g_sp] = void 0;
    g_r0 = g_underflow;
    g_nargs = 0;
    g_trampoline(module_descr[4]);
  } else {
    var index = info.index;
    var old = g_module_table[index];
    g_module_table[index] = module_descr;
    if (old === null) {
      ++g_module_count;
      if (g_module_count === g_module_table.length) {
        g_glo["##program-descr"] = [g_module_table,null,false];
        temp = g_module_table[g_module_table.length - 1][0];
        g_glo["##vm-main-module-ref"] = temp[temp.length - 1];
        g_sp = -1;
        g_stack[++g_sp] = void 0;
        g_r0 = g_underflow;
        g_nargs = 0;
        g_trampoline(g_module_table[0][4]);
      }
    }
  }
}

function g_poll(dest) {
  g_pollcount = 100;
  g_stack.length = g_sp + 1;
  return dest;
}

function G_ReturnPoint(id,parent,fs,link) {
  this.id = id;
  this.parent = parent;
  this.fs = fs;
  this.link = link;
}

G_ReturnPoint.prototype = Object.create(G_ControlPoint.prototype);

function g_scm_call(proc,args) {
  g_sp = -1;
  g_stack[++g_sp] = void 0;
  g_nargs = args.length;
  i = 0;
  while (i < g_nargs) {
    g_stack[++g_sp] = args[i];
    ++i;
  }
  if (g_nargs > 0) {
    if (g_nargs > 1) {
      if (g_nargs > 2) {
        g_r3 = g_stack[g_sp];
        --g_sp;
      }
      g_r2 = g_stack[g_sp];
      --g_sp;
    }
    g_r1 = g_stack[g_sp];
    --g_sp;
  }
  g_r0 = g_underflow;
  g_trampoline(proc);
  return g_r1;
}

function g_heapify_cont(ra) {
  if (g_sp > 0) {
    var fs = ra.fs;
    var link = ra.link;
    var base = g_sp - fs;
    var chain;
    if (base > 0) {
      chain = g_stack.slice(base,base + fs + 1);
      chain[0] = ra;
      g_sp = base;
      var prev_frame = chain;
      var prev_link = link;
      ra = prev_frame[prev_link];
      fs = ra.fs;
      link = ra.link;
      base = g_sp - fs;
      while (base > 0) {
        var frame = g_stack.slice(base,base + fs + 1);
        frame[0] = ra;
        g_sp = base;
        prev_frame[prev_link] = frame;
        prev_frame = frame;
        prev_link = link;
        ra = prev_frame[prev_link];
        fs = ra.fs;
        link = ra.link;
        base = g_sp - fs;
      }
      g_stack[link] = g_stack[0];
      g_stack[0] = ra;
      prev_frame[prev_link] = (g_stack.length = fs + 1 , g_stack);
    } else {
      g_stack[link] = g_stack[0];
      g_stack[0] = ra;
      chain = (g_stack.length = fs + 1 , g_stack);
    }
    g_stack = [chain];
    g_sp = 0;
  }
  return g_underflow;
}

function g_host2scm_call(proc,args) {
  return g_scm2host(g_scm_call(proc,args.map( g_host2scm )));
}

function g_prepend_arg1(arg1) {
  var i = 0;
  if (g_nargs > 0) {
    g_stack[++g_sp] = g_r1;
    if (g_nargs > 1) {
      g_stack[++g_sp] = g_r2;
      if (g_nargs > 2) {
        g_stack[++g_sp] = g_r3;
      }
    }
  }
  g_stack[++g_sp] = null;
  while (i < g_nargs) {
    g_stack[g_sp - i] = g_stack[g_sp - (i + 1)];
    ++i;
  }
  g_stack[g_sp - i] = arg1;
  ++g_nargs;
  if (g_nargs > 0) {
    if (g_nargs > 1) {
      if (g_nargs > 2) {
        g_r3 = g_stack[g_sp];
        --g_sp;
      }
      g_r2 = g_stack[g_sp];
      --g_sp;
    }
    g_r1 = g_stack[g_sp];
    --g_sp;
  }
}

function g_scm2host_call(fn) {
  if (g_nargs > 0) {
    g_stack[++g_sp] = g_r1;
    if (g_nargs > 1) {
      g_stack[++g_sp] = g_r2;
      if (g_nargs > 2) {
        g_stack[++g_sp] = g_r3;
      }
    }
  }
  var args = g_stack.slice(g_sp + 1 - g_nargs,g_sp + 1 - g_nargs + g_nargs);
  g_sp += - g_nargs;
  var ra = g_heapify_cont(g_r0);
  var frame = g_stack[0];
  var tmp = args.map( g_scm2host );
  tmp = fn.apply( null, tmp );
  g_r1 = g_host2scm(tmp);
  g_sp = -1;
  g_stack[++g_sp] = frame;
  return ra;
}

function g_wrong_nargs(proc) {
  g_prepend_arg1(proc);
  return g_peps["##raise-wrong-number-of-arguments-exception-nary"];
}

g_module_registry_init([new G_ModLinkInfo("exo01",0)]);

