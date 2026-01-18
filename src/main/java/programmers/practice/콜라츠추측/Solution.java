package programmers.practice.콜라츠추측;

public class Solution {
    public int solution(int num) {
        long longnumber = num;

        if (longnumber == 1) {
            return 0;
        }

        int count = 0;
        while (count < 500) {
            longnumber = collatz(longnumber);

            count++;

            if (longnumber == 1) {
                break;
            }
        }

        if (longnumber == 1) {
            return count;
        } else {
            return -1;
        }
    }

    private static long collatz(long longnumber) {
        if (isEven(longnumber)) {
            longnumber /= 2;
        } else {
            longnumber *= 3;
            longnumber += 1;
        }

        return longnumber;
    }

    private static boolean isEven(long longnumber) {
        return longnumber % 2 == 0;
    }
}
