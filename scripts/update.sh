git checkout src
scripts/fix_double_nomenclature.sh
patch -p1 < patches/invoice_ru.diff
scripts/translate.sh
