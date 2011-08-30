/*jslint browser: true, unparam: true, vars: true, white: true, maxerr: 50, indent: 4 */

// Continuation marks
(function(baselib) {
    'use strict';
    var exports = {};
    baselib.contmarks = exports;


    var ContinuationMarkSet = function(kvlists) {
        this.kvlists = kvlists;
    };

    ContinuationMarkSet.prototype.toDomNode = function(cache) {
        var dom = document.createElement("span");
        dom.appendChild(document.createTextNode('#<continuation-mark-set>'));
        return dom;
    };

    ContinuationMarkSet.prototype.toWrittenString = function(cache) {
        return '#<continuation-mark-set>';
    };

    ContinuationMarkSet.prototype.toDisplayedString = function(cache) {
        return '#<continuation-mark-set>';
    };

    ContinuationMarkSet.prototype.ref = function(key) {
        var i, j;
        var result = [];
        for (i = 0; i < this.kvlists.length; i++) {
            var kvlist = this.kvlists[i];
            for (j = 0; j < this.kvlist.length; j++) {
                if (baselib.equality.equals(kvlist[j][0], key)) {
                    result.push(kvlist[j][1]);
                }
            }
        }
        return baselib.lists.makeList.apply(null, result);
    };




    // A continuation prompt tag labels a prompt frame.
    var ContinuationPromptTag = function(name) {
	this.name = name;
    };






    exports.ContinuationMarkSet = ContinuationMarkSet;
    exports.ContinuationPromptTag = ContinuationPromptTag;

}(this.plt.baselib));