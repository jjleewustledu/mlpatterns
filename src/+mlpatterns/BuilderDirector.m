classdef BuilderDirector
    
    methods
        function prd = construct(this)
            cbldr = this.concreteBuilder0_;
            cbldr = buildPartA(cbldr);
            cbldr = buildPartB(cbldr);
            cbldr = buildPartC(cbldr);
            prd   = cbldr.getProduct;
        end
        function this = BuilderDirector(cbldr)
            assert(isa(cbldr, 'mlpatterns.Builder'));
            this.concreteBuilder0_ = cbldr;
        end
    end
    
    properties (Access = 'private')
        concreteBuilder0_
    end
end