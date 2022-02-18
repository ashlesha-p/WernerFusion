function c = controlled_product(v1, v2, i1, i2, j1, j2)
c = v1*v2;
if v1 == -1
    if i2==j2
        c = -1;
    else
        c = 0;
    end
end
if v2 == -1
    if i1==j1
        c = -1;
    else
        c = 0;
    end
end

end