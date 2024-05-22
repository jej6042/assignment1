`timescale 1ns / 1ps

module simple_cpu_tb;
reg clk;
reg reset;
reg [7:0] instruction;
wire [7:0] acc;

// CPU 모듈 인스턴스화
simple_cpu u0 (
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .acc(acc)
);

// 클록 생성
always #5 clk = ~clk;

initial begin
    // 초기화
    clk = 0;
    reset = 1;
    instruction = 8'b0;
    #20; // 리셋 시간을 주어 시스템이 초기화되도록 함
    
    reset = 0;
    #20;

    // LDI 5; 누산기에 5를 로드
    instruction = 8'b00010101; // LDI 명령어와 데이터
    #10; // 명령어 변경 후 즉시 다음 클록을 기다림
    #20; // 추가 클록 사이클을 기다림
    
    // ADD 3; 누산기 값에 3을 더함
    instruction = 8'b00100011; // ADD 명령어와 데이터
    #10; // 명령어 변경 후 즉시 다음 클록을 기다림
    #20; // 추가 클록 사이클을 기다림
    
    // SUB 2; 누산기 값에서 2를 뺌
    instruction = 8'b00110010; // SUB 명령어와 데이터
    #10; // 명령어 변경 후 즉시 다음 클록을 기다림
    #20; // 추가 클록 사이클을 기다림

    $finish; // 시뮬레이션 종료
end

endmodule