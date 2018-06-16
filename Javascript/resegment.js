/**
 * 
 * @author Chan Mrate Ko Ko
 *
 */

const RESEGMENT_REGULAR_EX = /(?:(?<!\u1039)([\u1000-\u102A\u103F\u104A-\u104F]|[\u1040-\u1049]+|[^\u1000-\u104F]+)(?![\u103E\u103B]?[\u1039\u103A\u1037]))/g;

function segment(text) {
	var outArray = text.replace(RESEGMENT_REGULAR_EX, "𝕊$1").split('𝕊')
	if (outArray.length > 0) {
		outArray.shift();
		//out.splice(0, 1);
	}
	return outArray;
}