package programmers.kakaointership.수식최대화;

import java.util.ArrayList;
import java.util.List;

public class Solution {
    public static final char[][] COMBINATIONS = {
            {'+', '-', '*'},
            {'+', '*', '-'},
            {'-', '+', '*'},
            {'-', '*', '+'},
            {'*', '+', '-'},
            {'*', '-', '+'}
    };

    public long solution(String expression) {
        List<Long> parsedNumbers = new ArrayList<>();
        List<Character> parsedOps = new ArrayList<>();

        StringBuilder numberBuffer = new StringBuilder();
        for (char c : expression.toCharArray()) {
            if (c == '+' || c == '-' || c == '*') {
                parsedNumbers.add(Long.parseLong(numberBuffer.toString()));
                parsedOps.add(c);
                numberBuffer.setLength(0);
            } else {
                numberBuffer.append(c);
            }
        }
        parsedNumbers.add(Long.parseLong(numberBuffer.toString()));

        long maxResult = 0;

        for (char[] combination : COMBINATIONS) {
            List<Long> numbers = new ArrayList<>(parsedNumbers);
            List<Character> ops = new ArrayList<>(parsedOps);

            for (char operator : combination) {
                for (int i = 0; i < ops.size(); i++) {
                    if (ops.get(i) == operator) {
                        final Long number1 = numbers.get(i);
                        final Long number2 = numbers.get(i + 1);
                        final long result = calculate(number1, number2, operator);

                        numbers.remove(i + 1);
                        numbers.set(i, result);
                        ops.remove(i);

                        i--;
                    }
                }
            }
            maxResult = Math.max(maxResult, Math.abs(numbers.get(0)));
        }

        return maxResult;
    }

    private long calculate(Long number1, Long number2, char operator) {
        switch (operator) {
            case '+':
                return number1 + number2;
            case '-':
                return number1 - number2;
            case '*':
                return number1 * number2;
            default:
                return 0;
        }
    }

    /*
    문자열을 분리해서 숫자와 연산자를 따로 관리하기
    연산자의 조합 수가 적기 때문에 하드코딩으로 순회하기
    각 조합 별로 결과 값을 구하고 최대 값 찾기
     */
}
