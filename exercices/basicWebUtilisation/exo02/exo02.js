// File generated by Gambit v4.9.3
// Link info: (409003 (js ()) "exo02" (("exo02")) (module_register glo make_interned_symbol string peps sp stack r0 r1 ffi poll pollcount wrong_nargs nargs) () (button-click-set! log main get-input-value exo02# alert-input-msg document.write) () #f)

var g_cst0_G_exo02 = new G_ScmString([60,105,110,112,117,116,32,116,121,112,101,61,34,115,117,98,109,105,116,34,32,118,97,108,117,101,61,34,68,105,115,112,108,97,121,32,116,104,101,32,102,111,108,108,111,119,105,110,103,32,116,101,120,116,32,105,110,32,65,108,101,114,116,32,33,34,32,111,110,99,108,105,99,107,61,34,100,105,115,112,108,97,121,73,110,112,117,116,84,101,120,116,40,41,34,62,60,47,105,110,112,117,116,62]);

var g_cst1_G_exo02 = new G_ScmString([60,105,110,112,117,116,32,116,121,112,101,61,34,116,101,120,116,34,32,105,100,61,34,109,121,105,110,112,117,116,34,62,60,47,105,110,112,117,116,62]);

function g_bb1_exo02_23_() { // entry-point
  if (g_nargs !== 0) {
    return g_wrong_nargs(g_bb1_exo02_23_);
  }
  if (--g_pollcount === 0) {
    return g_poll(g_bb2_exo02_23_);
  } else {
    g_nargs = 0;
    return g_bb1_main();
  }
}

g_bb1_exo02_23_.id = 0;
g_bb1_exo02_23_.parent = g_bb1_exo02_23_;
g_bb1_exo02_23_.nfree = -1;
g_bb1_exo02_23_._name = g_make_interned_symbol("exo02#");
g_bb1_exo02_23_.ctrlpts = null;
g_bb1_exo02_23_.info = false;

function g_bb2_exo02_23_() {
  g_nargs = 0;
  return g_bb1_main();
}

g_bb2_exo02_23_.id = 1;
g_bb2_exo02_23_.parent = g_bb1_exo02_23_;


g_bb1_exo02_23_.ctrlpts = [g_bb1_exo02_23_,g_bb2_exo02_23_];


g_peps["exo02#"] = g_bb1_exo02_23_;
g_glo["exo02#"] = g_bb1_exo02_23_;

function g_bb1_log() { // entry-point
  if (g_nargs !== 1) {
    return g_wrong_nargs(g_bb1_log);
  }
  console.log(g_scm2host(g_r1));g_r1 = void 0;
  return g_r0;
}

g_bb1_log.id = 0;
g_bb1_log.parent = g_bb1_log;
g_bb1_log.nfree = -1;
g_bb1_log._name = g_make_interned_symbol("log");
g_bb1_log.ctrlpts = null;
g_bb1_log.info = false;


g_bb1_log.ctrlpts = [g_bb1_log];


g_peps["log"] = g_bb1_log;
g_glo["log"] = g_bb1_log;

function g_bb1_document_2e_write() { // entry-point
  if (g_nargs !== 1) {
    return g_wrong_nargs(g_bb1_document_2e_write);
  }
  document.write(g_scm2host(g_r1));g_r1 = void 0;
  return g_r0;
}

g_bb1_document_2e_write.id = 0;
g_bb1_document_2e_write.parent = g_bb1_document_2e_write;
g_bb1_document_2e_write.nfree = -1;
g_bb1_document_2e_write._name = g_make_interned_symbol("document.write");
g_bb1_document_2e_write.ctrlpts = null;
g_bb1_document_2e_write.info = false;


g_bb1_document_2e_write.ctrlpts = [g_bb1_document_2e_write];


g_peps["document.write"] = g_bb1_document_2e_write;
g_glo["document.write"] = g_bb1_document_2e_write;

function g_bb1_get_2d_input_2d_value() { // entry-point
  if (g_nargs !== 0) {
    return g_wrong_nargs(g_bb1_get_2d_input_2d_value);
  }
  g_r1 = g_host2scm(document.getElementById("myinput").value );
  return g_r0;
}

g_bb1_get_2d_input_2d_value.id = 0;
g_bb1_get_2d_input_2d_value.parent = g_bb1_get_2d_input_2d_value;
g_bb1_get_2d_input_2d_value.nfree = -1;
g_bb1_get_2d_input_2d_value._name = g_make_interned_symbol("get-input-value");
g_bb1_get_2d_input_2d_value.ctrlpts = null;
g_bb1_get_2d_input_2d_value.info = false;


g_bb1_get_2d_input_2d_value.ctrlpts = [g_bb1_get_2d_input_2d_value];


g_peps["get-input-value"] = g_bb1_get_2d_input_2d_value;
g_glo["get-input-value"] = g_bb1_get_2d_input_2d_value;

function g_bb1_alert_2d_input_2d_msg() { // entry-point
  if (g_nargs !== 0) {
    return g_wrong_nargs(g_bb1_alert_2d_input_2d_msg);
  }
  g_stack[g_sp+1] = g_r0;
  ++g_sp;
  if (--g_pollcount === 0) {
    return g_poll(g_bb2_alert_2d_input_2d_msg);
  } else {
    g_r0 = g_bb3_alert_2d_input_2d_msg;
    g_nargs = 0;
    return g_bb1_get_2d_input_2d_value();
  }
}

g_bb1_alert_2d_input_2d_msg.id = 0;
g_bb1_alert_2d_input_2d_msg.parent = g_bb1_alert_2d_input_2d_msg;
g_bb1_alert_2d_input_2d_msg.nfree = -1;
g_bb1_alert_2d_input_2d_msg._name = g_make_interned_symbol("alert-input-msg");
g_bb1_alert_2d_input_2d_msg.ctrlpts = null;
g_bb1_alert_2d_input_2d_msg.info = false;

function g_bb2_alert_2d_input_2d_msg() {
  g_r0 = g_bb3_alert_2d_input_2d_msg;
  g_nargs = 0;
  return g_bb1_get_2d_input_2d_value();
}

g_bb2_alert_2d_input_2d_msg.id = 1;
g_bb2_alert_2d_input_2d_msg.parent = g_bb1_alert_2d_input_2d_msg;

function g_bb3_alert_2d_input_2d_msg() { // return-point
  g_r0 = g_bb4_alert_2d_input_2d_msg;
  g_nargs = 1;
  return g_peps["log"]();
}

g_bb3_alert_2d_input_2d_msg.id = 2;
g_bb3_alert_2d_input_2d_msg.parent = g_bb1_alert_2d_input_2d_msg;
g_bb3_alert_2d_input_2d_msg.fs = 1;
g_bb3_alert_2d_input_2d_msg.link = 1;

function g_bb4_alert_2d_input_2d_msg() { // return-point
  alert (document.getElementById("myinput").value );g_r1 = void 0;
  --g_sp;
  return g_stack[g_sp+1]();
}

g_bb4_alert_2d_input_2d_msg.id = 3;
g_bb4_alert_2d_input_2d_msg.parent = g_bb1_alert_2d_input_2d_msg;
g_bb4_alert_2d_input_2d_msg.fs = 1;
g_bb4_alert_2d_input_2d_msg.link = 1;


g_bb1_alert_2d_input_2d_msg.ctrlpts = [g_bb1_alert_2d_input_2d_msg,g_bb2_alert_2d_input_2d_msg,g_bb3_alert_2d_input_2d_msg,g_bb4_alert_2d_input_2d_msg];


g_peps["alert-input-msg"] = g_bb1_alert_2d_input_2d_msg;
g_glo["alert-input-msg"] = g_bb1_alert_2d_input_2d_msg;

function g_bb1_button_2d_click_2d_set_21_() { // entry-point
  if (g_nargs !== 1) {
    return g_wrong_nargs(g_bb1_button_2d_click_2d_set_21_);
  }
  displayInputText = g_scm2host(g_r1);g_r1 = void 0;
  return g_r0;
}

g_bb1_button_2d_click_2d_set_21_.id = 0;
g_bb1_button_2d_click_2d_set_21_.parent = g_bb1_button_2d_click_2d_set_21_;
g_bb1_button_2d_click_2d_set_21_.nfree = -1;
g_bb1_button_2d_click_2d_set_21_._name = g_make_interned_symbol("button-click-set!");
g_bb1_button_2d_click_2d_set_21_.ctrlpts = null;
g_bb1_button_2d_click_2d_set_21_.info = false;


g_bb1_button_2d_click_2d_set_21_.ctrlpts = [g_bb1_button_2d_click_2d_set_21_];


g_peps["button-click-set!"] = g_bb1_button_2d_click_2d_set_21_;
g_glo["button-click-set!"] = g_bb1_button_2d_click_2d_set_21_;

function g_bb1_main() { // entry-point
  if (g_nargs !== 0) {
    return g_wrong_nargs(g_bb1_main);
  }
  g_stack[g_sp+1] = g_r0;
  g_r1 = g_cst0_G_exo02;
  ++g_sp;
  if (--g_pollcount === 0) {
    return g_poll(g_bb2_main);
  } else {
    g_r0 = g_bb3_main;
    g_nargs = 1;
    return g_bb1_document_2e_write();
  }
}

g_bb1_main.id = 0;
g_bb1_main.parent = g_bb1_main;
g_bb1_main.nfree = -1;
g_bb1_main._name = g_make_interned_symbol("main");
g_bb1_main.ctrlpts = null;
g_bb1_main.info = false;

function g_bb2_main() {
  g_r0 = g_bb3_main;
  g_nargs = 1;
  return g_bb1_document_2e_write();
}

g_bb2_main.id = 1;
g_bb2_main.parent = g_bb1_main;

function g_bb3_main() { // return-point
  g_r1 = g_cst1_G_exo02;
  g_r0 = g_bb4_main;
  g_nargs = 1;
  return g_bb1_document_2e_write();
}

g_bb3_main.id = 2;
g_bb3_main.parent = g_bb1_main;
g_bb3_main.fs = 1;
g_bb3_main.link = 1;

function g_bb4_main() { // return-point
  g_r1 = g_bb6_main;
  g_r0 = g_stack[g_sp];
  if (--g_pollcount === 0) {
    return g_poll(g_bb5_main);
  } else {
    g_nargs = 1;
    --g_sp;
    return g_bb1_button_2d_click_2d_set_21_();
  }
}

g_bb4_main.id = 3;
g_bb4_main.parent = g_bb1_main;
g_bb4_main.fs = 1;
g_bb4_main.link = 1;

function g_bb6_main() { // entry-point
  if (g_nargs !== 0) {
    return g_wrong_nargs(g_bb6_main);
  }
  if (--g_pollcount === 0) {
    return g_poll(g_bb7_main);
  } else {
    g_nargs = 0;
    return g_bb1_alert_2d_input_2d_msg();
  }
}

g_bb6_main.id = 4;
g_bb6_main.parent = g_bb1_main;
g_bb6_main.nfree = -1;

function g_bb5_main() {
  g_nargs = 1;
  --g_sp;
  return g_bb1_button_2d_click_2d_set_21_();
}

g_bb5_main.id = 5;
g_bb5_main.parent = g_bb1_main;

function g_bb7_main() {
  g_nargs = 0;
  return g_bb1_alert_2d_input_2d_msg();
}

g_bb7_main.id = 6;
g_bb7_main.parent = g_bb1_main;


g_bb1_main.ctrlpts = [g_bb1_main,g_bb2_main,g_bb3_main,g_bb4_main,g_bb6_main,g_bb5_main,g_bb7_main];


g_peps["main"] = g_bb1_main;
g_glo["main"] = g_bb1_main;

g_module_register([[g_make_interned_symbol("exo02")],[],null,1,g_bb1_exo02_23_,false]);

