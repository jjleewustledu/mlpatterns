classdef BuilderImpl < mlpatterns.Builder
    
    properties
        a
        b
        c
    end
    
    methods
        function prd = getProduct(this)
            this.currentProduct_ = sprintf('product <- %s, %s, %s', this.a, this.b, this.c); 
            prd = this.currentProduct_;
        end
        function this = buildPartA(this)
            this.a = 'example part A';
        end
        function this = buildPartB(this)
            this.b = 'example part B';
        end
        function this = buildPartC(this)
            this.c = 'example part C';
        end
    end
    
    properties (Access = 'private')
        currentProduct_
    end
end