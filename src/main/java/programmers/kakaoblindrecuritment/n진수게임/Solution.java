package programmers.kakaoblindrecuritment.n진수게임;

public class Solution {

    public String solution(int n, int t, int m, int p) {
        String answer = "";
        final StringBuilder sb = new StringBuilder();
//        final StringBuilder answer = new StringBuilder();
//        final StringBuilder sequence = new StringBuilder();

//        int currentNumber = 0;
//
//        while (sequence.length() < t * m) {
//            sequence.append(Integer.toString(currentNumber++, n).toUpperCase());
//        }
//
//        for (int i = 0; i < t; i++) {
//            int index = (p - 1) + (i * m);
//            answer.append(sequence.charAt(index));
//        }
//
//        return answer.toString();

        for (int i = 0; i < t * m; i++) {
            sb.append(Integer.toString(i, n).toUpperCase());
        }
        final String string = sb.toString();
        final char[] charArray = string.toCharArray();

        int i = p - 1;
        while (answer.length() < t) {
            answer += charArray[i];
            i += m;
        }

        return answer;
    }
}
