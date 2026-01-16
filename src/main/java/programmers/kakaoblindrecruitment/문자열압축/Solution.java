package programmers.kakaoblindrecruitment.문자열압축;

public class Solution {
    public int solution(String target) {
        int result = target.length();

        for (int i = 1; i <= target.length() / 2; i++) { // 1개 단위로 압축, 2개 단위로 압축, 3개 단위로 압축 ... 최대 절반 길이 단위까지 압축
            StringBuilder compressedResult = new StringBuilder();

            String expectedRepeat = target.substring(0, i);
            int count = 1;

            for (int j = i; j < target.length(); j += i) {
                String current = "";

                if (j + i > target.length()) {
                    current = target.substring(j);
                } else {
                    current = target.substring(j, j + i);
                }

                if (expectedRepeat.equals(current)) {
                    count++;
                } else {
                    if (count > 1) {
                        compressedResult.append(count).append(expectedRepeat);
                    } else {
                        compressedResult.append(expectedRepeat);
                    }

                    expectedRepeat = current;
                    count = 1;
                }
            }
            if (count > 1) {
                compressedResult.append(count).append(expectedRepeat);
            } else {
                compressedResult.append(expectedRepeat);
            }

            result = Math.min(result, compressedResult.length());
        }

        return result;
    }
}