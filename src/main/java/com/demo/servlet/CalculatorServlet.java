package com.demo.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * 電卓の計算処理を行うServlet
 */
@WebServlet("/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // リクエストとレスポンスの文字エンコーディングを設定
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            // パラメータの取得
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");
            String operator = request.getParameter("operator");

            // 入力値の検証
            if (num1Str == null || num1Str.trim().isEmpty() ||
                num2Str == null || num2Str.trim().isEmpty() ||
                operator == null || operator.trim().isEmpty()) {
                
                request.setAttribute("error", "すべての項目を入力してください。");
                request.getRequestDispatcher("/calculator.jsp").forward(request, response);
                return;
            }

            // 数値への変換
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);
            double result = 0;
            String operatorSymbol = "";

            // 演算の実行
            switch (operator) {
                case "add":
                    result = num1 + num2;
                    operatorSymbol = "+";
                    break;
                case "subtract":
                    result = num1 - num2;
                    operatorSymbol = "-";
                    break;
                case "multiply":
                    result = num1 * num2;
                    operatorSymbol = "×";
                    break;
                case "divide":
                    if (num2 == 0) {
                        request.setAttribute("error", "ゼロで除算することはできません。");
                        request.getRequestDispatcher("/calculator.jsp").forward(request, response);
                        return;
                    }
                    result = num1 / num2;
                    operatorSymbol = "÷";
                    break;
                default:
                    request.setAttribute("error", "無効な演算子です。");
                    request.getRequestDispatcher("/calculator.jsp").forward(request, response);
                    return;
            }

            // 結果をリクエスト属性に設定
            request.setAttribute("num1", num1);
            request.setAttribute("num2", num2);
            request.setAttribute("operator", operatorSymbol);
            request.setAttribute("result", result);

            // 結果ページへ転送
            request.getRequestDispatcher("/result.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "数値を正しく入力してください。");
            request.getRequestDispatcher("/calculator.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // GETリクエストの場合は電卓ページにリダイレクト
        response.sendRedirect(request.getContextPath() + "/calculator.jsp");
    }
}

// Made with Bob
