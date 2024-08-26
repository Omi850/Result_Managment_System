package com.bean;

public class result {
private int id;
private int java;
private int ajava;
private int html;
private int css;
private int script;
private int total_mark;
private Float per;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getJava() {
	return java;
}
public void setJava(int java) {
	this.java = java;
}
public int getAjava() {
	return ajava;
}
public void setAjava(int ajava) {
	this.ajava = ajava;
}
public int getHtml() {
	return html;
}
public void setHtml(int html) {
	this.html = html;
}
public int getCss() {
	return css;
}
public void setCss(int css) {
	this.css = css;
}
public int getScript() {
	return script;
}
public void setScript(int script) {
	this.script = script;
}
public int getTotal_mark() {
	return total_mark;
}
public void setTotal_mark(int total_mark) {
	this.total_mark = total_mark;
}
public Float getPer() {
	return per;
}
public void setPer(Float per) {
	this.per = per;
}
@Override
public String toString() {
	return "result [id=" + id + ", java=" + java + ", ajava=" + ajava + ", html=" + html + ", css=" + css + ", script="
			+ script + ", total_mark=" + total_mark + ", per=" + per + "]";
}
public result() {
	super();
	// TODO Auto-generated constructor stub
}
public result(int id, int java, int ajava, int html, int css, int script, int total_mark, Float per) {
	super();
	this.id = id;
	this.java = java;
	this.ajava = ajava;
	this.html = html;
	this.css = css;
	this.script = script;
	this.total_mark = total_mark;
	this.per = per;
}


}
