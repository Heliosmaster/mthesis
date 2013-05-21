%clear all; close all; clc;

%warning('off','MATLAB:warn_truncate_for_loop_index');

printIteration = 0;
% read the input sparse matrix
% d = dir('../matrices/m_testbed/*.mtx');
d = dir('../matrices/testbed2/*.mtx');

for k=1:length(d)
    matrix = d(k).name;
    % matrix = 'impcol_b';
    str = ['../matrices/testbed2/' matrix]; % '.mtx'];
    A = mmread(str);

    clear str

    %iteration number
    iter = 10;
    i=1;
    results = zeros(1,iter);
    
    fprintf('\n%s\n\n',matrix);

    %initial split (8 = twodim)
    [I, s, ~, ~ , ~, ~, ~, ~, ~, ~, ~] = mondriaan(A,2,0.03,2,0,8);
    results(1) = s(4);
    %separating the two parts as S1 and S2
    [m,n] = size(A);
    
    initial_split = I;
    
    try
        fprintf('po_simple asc:\t\t ');
        v = po_simple(A);
        fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_simple(A);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_simple desc:\t\t ');
        v = po_simple(A,'descend');
        fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_simple(A,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_random:\t\t ');
        v = po_random(A);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_random(A);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_mix_alt0:\t\t ');
        v = po_mix(A,0,0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_mix(A,0,0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_mix_alt1:\t\t ');
        v = po_mix(A,0,1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_mix(A,0,1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_mix_spr0:\t\t ');
        v = po_mix(A,1,0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_mix(A,1,0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_mix_spr1:\t\t ');
        v = po_mix(A,1,1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_mix(A,1,1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_w_asc_0:\t ');
        v = po_sort_mix(A,0,1,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,1,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_w_asc_1:\t ');
        v = po_sort_mix(A,0,1,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,1,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end    
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_w_desc_0:\t ');
        v = po_sort_mix(A,0,1,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,1,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_w_desc_1:\t ');
        v = po_sort_mix(A,0,1,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,1,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_nw_asc_0:\t ');
        v = po_sort_mix(A,0,0,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,0,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_nw_asc_1:\t ');
        v = po_sort_mix(A,0,0,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,0,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_nw_desc_0:\t ');
        v = po_sort_mix(A,0,0,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,0,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_alt_nw_desc_1:\t ');
        v = po_sort_mix(A,0,0,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,0,0,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_w_asc_0:\t ');
        v = po_sort_mix(A,1,1,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,1,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_w_asc_1:\t ');
        v = po_sort_mix(A,1,1,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,1,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_w_desc_0:\t ');
        v = po_sort_mix(A,1,1,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,1,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_w_desc_1:\t ');
        v = po_sort_mix(A,1,1,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,1,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_nw_asc_0:\t ');
        v = po_sort_mix(A,1,0,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,0,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
       
    try
        fprintf('po_sm_spr_nw_asc_1:\t ');
        v = po_sort_mix(A,1,0,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,0,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_nw_desc_0:\t ');
        v = po_sort_mix(A,1,0,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,0,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sm_spr_nw_desc_1:\t ');
        v = po_sort_mix(A,1,0,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_mix(A,1,0,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_w_asc:\t\t ');
        v = po_sort_simple(A,1,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_simple(A,1,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_w_desc:\t\t ');
        v = po_sort_simple(A,1,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_simple(A,1,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_nw_asc:\t\t ');
        v = po_sort_simple(A,0,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_simple(A,0,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_nw_desc:\t\t ');
        v = po_sort_simple(A,0,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_simple(A,0,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    
    %
    
    try
        fprintf('po_sr_w_asc:\t\t ');
        v = po_sort_random(A,1,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_random(A,1,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sr_w_desc:\t\t ');
        v = po_sort_random(A,1,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_random(A,1,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sr_nw_asc:\t\t ');
        v = po_sort_random(A,0,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_random(A,0,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sr_nw_desc:\t\t ');
        v = po_sort_random(A,0,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = po_sort_random(A,0,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    try
        fprintf('pa_simple asc:\t\t ');
        v = pa_simple(A);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_simple(A);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_simple desc:\t\t ');
        v = pa_simple(A,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_simple(A,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_random:\t\t ');
        v = pa_random(A);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_random(A);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_mix_alt0:\t\t ');
        v = pa_mix(A,0,0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_mix(A,0,0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_mix_alt1:\t\t ');
        v = pa_mix(A,0,1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_mix(A,0,1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_mix_spr0:\t\t ');
        v = pa_mix(A,1,0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_mix(A,1,0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_mix_spr1:\t\t ');
        v = pa_mix(A,1,1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_mix(A,1,1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_w_asc_0:\t ');
        v = pa_sort_mix(A,0,1,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,1,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_w_asc_1:\t ');
        v = pa_sort_mix(A,0,1,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,1,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end    
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_w_desc_0:\t ');
        v = pa_sort_mix(A,0,1,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,1,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_w_desc_1:\t ');
        v = pa_sort_mix(A,0,1,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,1,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_nw_asc_0:\t ');
        v = pa_sort_mix(A,0,0,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,0,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_nw_asc_1:\t ');
        v = pa_sort_mix(A,0,0,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,0,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_nw_desc_0:\t ');
        v = pa_sort_mix(A,0,0,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,0,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_alt_nw_desc_1:\t ');
        v = pa_sort_mix(A,0,0,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,0,0,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_w_asc_0:\t ');
        v = pa_sort_mix(A,1,1,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,1,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_w_asc_1:\t ');
        v = pa_sort_mix(A,1,1,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,1,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_w_desc_0:\t ');
        v = pa_sort_mix(A,1,1,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,1,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_w_desc_1:\t ');
        v = pa_sort_mix(A,1,1,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,1,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_nw_asc_0:\t ');
        v = pa_sort_mix(A,1,0,'ascend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,0,'ascend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
       
    try
        fprintf('pa_sm_spr_nw_asc_1:\t ');
        v = pa_sort_mix(A,1,0,'ascend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,0,'ascend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_nw_desc_0:\t ');
        v = pa_sort_mix(A,1,0,'descend',0);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,0,'descend',0);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('pa_sm_spr_nw_desc_1:\t ');
        v = pa_sort_mix(A,1,0,'descend',1);
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_mix(A,1,0,'descend',1);
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_w_asc:\t\t ');
        v = pa_sort_simple(A,1,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_simple(A,1,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_w_desc:\t\t ');
        v = pa_sort_simple(A,1,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_simple(A,1,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_nw_asc:\t\t ');
        v = pa_sort_simple(A,0,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_simple(A,0,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_ss_nw_desc:\t\t ');
        v = pa_sort_simple(A,0,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_simple(A,0,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    
    %
    
    try
        fprintf('po_sr_w_asc:\t\t ');
        v = pa_sort_random(A,1,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_random(A,1,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sr_w_desc:\t\t ');
        v = pa_sort_random(A,1,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_random(A,1,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sr_nw_asc:\t\t ');
        v = pa_sort_random(A,0,'ascend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_random(A,0,'ascend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    try
        fprintf('po_sr_nw_desc:\t\t ');
        v = pa_sort_random(A,0,'descend');
         fprintf('%g ',s(4)); [Ac,Ar] = MatlabOverpaint(initial_split,v);
        for i=2:iter
            B = MatlabCreateB(Ac,Ar);
            [I2, s, ~, ~, ~, ~, ~, ~, ~, ~, ~] = mondriaan(B,2,0.03,0,0,5);
            results(i) = s(4);
            fprintf('%g ',s(4));
            Ar2 = I2(1:n,n+1:end)';
            Ac2 = I2(n+1:end,1:n);        
            A2 = Ar2+Ac2;
            v = pa_sort_random(A,0,'descend');
            [Ac,Ar] = MatlabOverpaint(A2,v);
        end
        fprintf('\t (avg %g)',mean(results));
    end
    fprintf('\n');
    
    fprintf('\n-----------\n');
end