/*
 * S9JSS/S9USS ajax callback function copyright(c)2018 S9Soft Inc.
 * 2018-12-18 Kim kukjin
 */
function s9autocomplete(a, b, c, d, e, f) {
    $.ajax({
        url: a,
        dataType: "jsonp",
        cache: !1,
        data: {
            query: b,
            count: c,
            detail: d,
            sequence: e
        },
        success: f
    })
};

function S9SoftAutoComplete() {}
S9SoftAutoComplete.prototype.autocomplete = function(a, b, c, d, e, f) {
    $.ajax({
        url: a,
        dataType: "jsonp",
        cache: !1,
        data: {
            query: b,
            count: c,
            detail: d,
            sequence: e
        },
        success: f
    })
};
var S9AC = new S9SoftAutoComplete;
/*
 * multi highlight function copyright(c)2015 S9Soft Inc.
 * 2015-04-23 Kim kukjin
 * Version 1.0.3 / 2016.08.01
 * Version 2.0.0 / 2018.11.03
 * Version 2.0.1 / 2019.01.17
 * Version 2.0.2 / 2019.01.27
 */
function S9SoftHighLight() {}
S9SoftHighLight.prototype.oldquery = null;
S9SoftHighLight.prototype.oldregex = null;
S9SoftHighLight.prototype.highlight = function(a, c) {
    return this.highlightTag(a, c, "<b>", "</b>")
};
S9SoftHighLight.prototype.highlightTag = function(a, c, e, f) {
    if (null == a || "" == a) return "";
    if (null == c || "" == c || "*" == c) return a;
    if (this.oldquery == c) var b = this.oldregex;
    else {
        b = this.splitDigit(c).split(/[\s~!@#$%^\-_+=|,.?/\\`&*'":;(){}<>\[\]]+/);
        for (var d in b) "" == b[d] && b.splice(d, 1);
        b = 1 == b.length && "" == b[0] ? null : new RegExp(b.sort().reverse().join("|"), "ig");
        this.oldquery = c;
        this.oldregex = b
    }
    return null == b ? a : a.replace(b, e + "$&" + f)
};
S9SoftHighLight.prototype.isDigitChar = function(a) {
    return "0" <= a && "9" >= a ? !0 : !1
};
S9SoftHighLight.prototype.splitDigit = function(a) {
    if (null == a || "" == a) return "";
    var c = "",
        e = !0,
        f, b = a.length;
    for (i = 0; i < b; i++) {
        var d = a.charAt(i);
        (f = this.isDigitChar(d)) && 0 == e && (c += " ");
        c += d;
        e = f
    }
    return c
};
var S9HL = new S9SoftHighLight;
/*
 * special function for query trim copyright(c)2015 S9Soft Inc.
 * 2017-11-23 Kim kukjin
 * Version 1.0.0 / 2017.11.23
 * Version 2.0.0 / 2017.11.24 to prototype
 */
function S9SoftQueryCleaner() {}
S9SoftQueryCleaner.prototype.oldQuery = "", S9SoftQueryCleaner.prototype.isEmpty = !0, S9SoftQueryCleaner.prototype.getOld = function() {
    return this.oldQuery
}, S9SoftQueryCleaner.prototype.reset = function() {
    this.oldQuery = ""
}, S9SoftQueryCleaner.prototype.clean = function(e) {
    if ("" == e) return e;
    var r = this.superTrim(e);
    return "" == r ? (this.isEmpty = !0, "") : (this.isEmpty = !1, this.oldQuery == r ? "" : (this.oldQuery = r, this.queryTrim(e)))
}, S9SoftQueryCleaner.prototype.spaceTrim = function(e) {
    if ("" == e) return e;
    for (var r, a = e.split(""), s = [], c = 0, t = 0; t < a.length; t++) r = a[t], " " >= r ? c > 0 && " " != s[c - 1] && (s[c++] = " ") : s[c++] = r;
    return 0 == c ? "" : s.join("").trim()
}, S9SoftQueryCleaner.prototype.queryTrim = function(e) {
    if ("" == e) return e;
    for (var r, a, s = e.split(""), c = [], t = 0, n = 0; n < s.length; n++) switch (r = s[n], a = this.replaceChar(r)) {
        case " ":
            t > 0 && " " != c[t - 1] && (c[t++] = " ");
            break;
        case "-":
            t > 0 && r != c[t - 1] && (c[t++] = r);
            break;
        default:
            c[t++] = s[n]
    }
    if (0 == t) return "";
    for (; t > 0 && (a = this.replaceChar(c[t - 1]), " " == a || "-" == a); t--) c.pop();
    return c.join("")
}, S9SoftQueryCleaner.prototype.superTrim = function(e) {
    if ("" == e) return e;
    for (var r, a, s = e.split(""), c = [], t = 0, n = 0; n < s.length; n++) switch (r = s[n], a = this.replaceChar(r)) {
        case " ":
            if (t > 0) switch (c[t - 1]) {
                case "-":
                    c[t - 1] = " ";
                    break;
                case " ":
                    break;
                default:
                    c[t++] = " "
            }
            break;
        case "-":
            if (t > 0) switch (c[t - 1]) {
                case "-":
                case " ":
                    break;
                default:
                    c[t++] = "-"
            }
            break;
        default:
            c[t++] = r
    }
    if (0 == t) return "";
    for (; t > 0 && (" " == c[t - 1] || "-" == c[t - 1]); t--) c.pop();
    return c.join("")
}, S9SoftQueryCleaner.prototype.replaceChar = function(e) {
    var r = e.charCodeAt(0);
    switch (r) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
            return " ";
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
            return "-";
        case 40:
        case 41:
            return " ";
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
            return "-";
        case 91:
            return " ";
        case 92:
            return "-";
        case 93:
            return " ";
        case 94:
        case 95:
        case 96:
            return "-";
        case 123:
            return " ";
        case 124:
            return "-";
        case 125:
            return " ";
        case 126:
            return "-";
        default:
            return e
    }
};
var S9QC = new S9SoftQueryCleaner();