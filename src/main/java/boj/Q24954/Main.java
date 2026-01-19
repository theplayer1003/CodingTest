package boj.Q24954;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Main {
    static int N;
    static int[] prices;
    static List<List<DiscountInfo>> discountGraph = new ArrayList<>();
    static boolean[] visited;
    static int minTotalCost = Integer.MAX_VALUE;

    static int[] dp;

    public static void main(String[] args) {
        final Scanner s = new Scanner(System.in);
        N = s.nextInt();
        prices = new int[N];
        visited = new boolean[N];

        for (int i = 0; i < N; i++) {
            prices[i] = s.nextInt();
        }

        for (int i = 0; i < N; i++) {
            discountGraph.add(new ArrayList<>());
        }

        for (int i = 0; i < N; i++) {
            final int p = s.nextInt();
            for (int j = 0; j < p; j++) {
                final int target = s.nextInt() - 1;
                final int discount = s.nextInt();
                discountGraph.get(i).add(new DiscountInfo(target, discount));
            }
        }

        backtrack(0, 0);
        System.out.println(minTotalCost);

//        dp = new int[1 << N];
//        Arrays.fill(dp, -1);
//
//        System.out.println(solve(0));
    }

    private static int solve(int currentMask) {
        if (currentMask == (1 << N) - 1) {
            return 0;
        }

        if (dp[currentMask] != -1) {
            return dp[currentMask];
        }

        int minCost = Integer.MAX_VALUE;

        for (int i = 0; i < N; i++) {
            if ((currentMask & (1 << i)) != 0) {
                continue;
            }
            ;

            int currentPrice = prices[i];
            for (int j = 0; j < N; j++) {
                if ((currentMask & (1 << j)) != 0) {
                    for (DiscountInfo info : discountGraph.get(j)) {
                        if (info.targetPotionIndex == i) {
                            currentPrice -= info.discountAmount;
                        }
                    }
                }
            }
            if (currentPrice < 1) {
                currentPrice = 1;
            }

            int nextCost = solve(currentMask | (1 << i)) + currentPrice;
            minCost = Math.min(minCost, nextCost);
        }

        dp[currentMask] = minCost;
        return minCost;
    }

    private static void backtrack(int depth, int currentCost) {
        if (depth == N) {
            minTotalCost = Math.min(minTotalCost, currentCost);
            return;
        }

        if (currentCost >= minTotalCost) {
            return;
        }

        for (int i = 0; i < N; i++) {
            if (visited[i]) {
                continue;
            }

            visited[i] = true;

            for (DiscountInfo info : discountGraph.get(i)) {
                prices[info.targetPotionIndex] -= info.discountAmount;
            }

            final int purchasePrice = Math.max(1, prices[i]);
            backtrack(depth + 1, currentCost + purchasePrice);

            for (DiscountInfo info : discountGraph.get(i)) {
                prices[info.targetPotionIndex] += info.discountAmount;
            }
            visited[i] = false;
        }
    }
}

class DiscountInfo {
    int targetPotionIndex;
    int discountAmount;

    public DiscountInfo(int targetPotionIndex, int discountAmount) {
        this.targetPotionIndex = targetPotionIndex;
        this.discountAmount = discountAmount;
    }
}
/*
입력 예제
4
10 15 20 25
2
3 10
2 20
0
1
4 10
1
1 10

물약 종류 4 개
A: 10원 -> 구매 시 C 물약 10원 할인, B 물약 20원 할인
B: 15원 ->
C: 20원 -> 구매 시 D 물약 10원 할인
D: 25원 -> 구매 시 A 물약 10원 할인
 */

/*
백트래킹

A, B, C 포션이 있다고 가정하면
A 포션 구매 -> B 포션 구매 -> C 포션 구매 탐색 후
C 구매한걸 취소하고 B로 올라옴 -> 다른걸 살 경우의 수가 없으니 B 구매도 취소
A 구매 가지수부터 다시 시작 -> B를 두번째로 사는 경우를 모두 탐색했으니 C 먼저 구매 -> B 구매

이런 식으로 재귀로 모든 경우의 수를 완전 탐색하는게 백트래킹

if (currentCost >= minTotalCost) return;
거기에 효율을 위해 찾고자하는 조건을 검사해서 아닌 경우는 가지 치기 한다.
현재 탐색 중인 포션 구매 루트의 비용이 이미 최소 값을 넘어버리면 더 탐색할 가치가 없으니 바로 해당 루트를 탈출

반복문으로
visited[i], 지금까지 무슨 포션을 샀는지 체크하고 이미 산 포션이면 continue;
할인 그래프에서 해당 포션을 사면 받는 혜택을 조회해 다른 포션 가격을 조정해준다
물약 가격은 1보다 작아지면 안되기 때문에 Math.max 로 조정
이번 노드의 물약 값과 지금까지 산 비용을 더해서 다음 depth 의 백트래킹 시작

제일 깊은 depth 까지 도달했으면 거꾸로 빠져나올 차례
빠져나오면 아까 변경해준 가격을 원래대로 돌려놔야함. 해당 노드의 혜택 가격을 원래대로 돌리고 구매 표시를 풀어주면서 탈출해 나간다.
 */

/*

 */