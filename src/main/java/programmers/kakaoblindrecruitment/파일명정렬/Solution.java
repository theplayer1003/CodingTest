package programmers.kakaoblindrecruitment.파일명정렬;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Solution {
    public String[] solution(String[] files) {
        String[] answer = new String[files.length];

        String regex = "(?<head>\\D+)(?<number>\\d{1,5})(?<tail>.*)";

        final Pattern pattern = Pattern.compile(regex);

        List<File> fileList = new ArrayList<>();
        for (String file : files) {
            final Matcher matcher = pattern.matcher(file);

            if (matcher.find()) {
                final String head = matcher.group("head");
                final String number = matcher.group("number");
                final String tail = matcher.group("tail");

                final File fileObject = new File(head, number, tail, file);

                fileList.add(fileObject);
            }
        }

        Collections.sort(fileList);

        for (int i = 0; i < files.length; i++) {
            answer[i] = fileList.get(i).originalFileName;
        }

        return answer;
    }

    static class File implements Comparable<File> {
        String head;
        String number;
        String tail;
        String originalFileName;

        public File(String head, String number, String tail, String originalFileName) {
            this.head = head;
            this.number = number;
            this.tail = tail;
            this.originalFileName = originalFileName;
        }

        @Override
        public int compareTo(File o) {
            final String headUpper = head.toUpperCase();
            final int headCompare = headUpper.compareTo(o.head.toUpperCase());

            if (headCompare != 0) {
                return headCompare;
            }

            final int num1 = Integer.parseInt(number);
            final int num2 = Integer.parseInt(o.number);

            return Integer.compare(num1, num2);
        }
    }
}
