/**
Given A and B two interval lists, A has no overlap inside A and B has no overlap inside B. Write the function to merge two interval lists, output the result with no overlap. Ask for a very efficient solution

For example,
A: [1,5], [10,14], [16,18]
B: [2,6], [8,10], [11,20]

output [1,6], [8, 20]
**/

public class MergeIntervalLists {
	public List<int[]> mergeIntervals(List<int[]> a, List<int[]> b) {
		if(a == null || a.size() == 0) {
			return b;
		}
		if(b == null || b.size() == 0) {
			returb a;
		}
		if(a == null && b == null) {
			return new Arrays.asList();
		}

		int aIndex = 0;
		int bIndex = 0;
		
		int[] curr;
		if(a.get(0)[0] <= b.get(0)[0]) {
			curr = a.get(0);
			++aIndex;
		} else {
			curr.b.get(0);
			++bIndex;
		}

		List<int[]> answer = new ArrayList<>();
		while(aIndex < a.size() || bIndex < b.size()) {
			if(aIndex < a.size() && bIndex < b.size()) {
				if(a.get(aIndex)[0] <= b.get(bIndex)[0] && a.get(aIndex)[0] < curr[1]) {
					curr = merge(curr, a.get(aIndex));
					++aIndex;
				} else if(a.get(aIndex)[0] > b.get(bIndex)[0] && b.get(bIndex)[0] < curr[1]) {
					curr = merge(curr, b.get(bIndex));
					++bIndex;
				} else {
					answer.add(curr);
					if(a.get(aIndex)[0] <= b.get(bIndex)[0]) {
						curr = a.get(aIndex);
						++aIndex;
					} else {
						curr.b.get(bIndex);
						++bIndex;
					}
				}
			} else if(aIndex < a.size()) {
				if(a.get(aIndex)[0] < curr[1]) {
					curr = merge(a.get(aIndex), curr);
				} else {
					answer.add(curr);
					curr = a.get(aIndex);
				}
				++aIndex;
			} else {
				if(a.get(bIndex)[0] < curr[1]) {
					curr = merge(b.get(bIndex), curr);
				} else {
					answer.add(curr);
					curr = b.get(bIndex);
				}
				++bIndex;
			}
		}

		answer.add(curr);

		return answer;
	}

	private int[] merge(int[] a, int[] b) {
		return new int[2]{Math.min(a[0], b[0]), Math.max(a[1], b[1])};
	}
}
