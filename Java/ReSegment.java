import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 
 * @author Chan Mrate Ko Ko
 *
 */
public class ReSegment {

	public static final String RESEGMENT_REGULAR_EX = "(?:(?<!\\u1039)([\\u1000-\\u102A\\u103F\\u104A-\\u104F]|[\\u1040-\\u1049]+|[^\\u1000-\\u104F]+)(?![\\u103E\\u103B]?[\\u1039\\u103A\\u1037]))";

	public synchronized List<String> segment(String text) {

		if (text == null) {
			throw new NullPointerException();
		}

		String[] outputs = text.replaceAll(RESEGMENT_REGULAR_EX, "\uD835\uDD4A$1").split("\uD835\uDD4A");

		List<String> segmentList = new ArrayList<String>(Arrays.asList(outputs));

		if (segmentList.size() > 0) {
			segmentList.remove(0);
		}

		return segmentList;
	}

}
