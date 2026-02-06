package programmers.kakaoblindrecruitment.파일명정렬;

import java.util.Arrays;
import java.util.Comparator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Solution2 {
    public String[] solution(String[] files) {
        final Pattern pattern = Pattern.compile("(?<head>\\D+)(?<number>\\d{1,5})(.*)");

        Arrays.sort(files, new Comparator<String>() {
            @Override
            public int compare(String s1, String s2) {
                final Matcher m1 = pattern.matcher(s1);
                final Matcher m2 = pattern.matcher(s2);

                m1.find();
                m2.find();

                final String head1 = m1.group("head");
                final String head2 = m2.group("head");

                final int headCompare = head1.compareToIgnoreCase(head2);

                if (headCompare != 0) {
                    return headCompare;
                }

                final int num1 = Integer.parseInt(m1.group("number"));
                final int num2 = Integer.parseInt(m2.group("number"));

                return Integer.compare(num1, num2);
            }
        });

        return files;
    }
}
