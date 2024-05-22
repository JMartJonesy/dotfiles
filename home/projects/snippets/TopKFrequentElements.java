/**
Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
**/

public class TopKFrequentElements {
	public int[] topKFrequent(int[] nums, int k) {
		HashMap<Integer, Integer> frequencies = new HashMap<>();
		for(int num : nums) {
			frequencies.put(num, frequencies.getOrDefault(num, 0) + 1);
		}

		PriorityQueue<Map.Entry<Integer, Integer>> kFrequent = new PriorityQueue<>(k, (a, b) -> a.getValue() - b.getValue());
		for(Map.Entry<Integer, Integer> entry : frequencies.entrySet()) {
			if(kFrequent.size() < k) {
				kFrequent.offer(entry);
			} else if(kFrequent.peek().getValue() < entry.getValue()) {
				kFrequent.poll();
				kFrequent.offer(entry);
			}
		}

		int[] answer = new int[k];
		for(int i = 0; i < k; ++i) {
			answer[i] = kFrequent.poll().getKey();
		}

		return answer;
	}
}
