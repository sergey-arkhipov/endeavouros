#!/bin/bash
# 📋 Rofi + CopyQ: нумерованный clipboard с быстрым выбором по цифрам

# Получаем историю (первые 20 записей) и добавляем нумерацию
ITEMS=$(copyq eval -- "
    tab('&clipboard');
    var items = [];
    for (i = 0; i < Math.min(size(), 50); ++i) {
        var text = str(read(i)).trim().replace(/\\n/g, '↲');
        items.push((i+1) + '. ' + text);
    }
    items.join('\\n');
")

# Показываем в Rofi (с поддержкой цифрового выбора)

SELECTION=$(echo -e "$ITEMS" | rofi -dmenu -p "📋" -theme-str '
configuration {
    font: "Fira Code 10";
    spacing: 8;  /* Увеличенный межстрочный интервал */
}
window {
    width: 65%;
    background-color: rgba(40, 42, 54, 0.92);  /* 92% - баланс читаемости */
    transparency: "real";  /* Для настоящей прозрачности */
    border-radius: 8px;
    border: none;

}
listview {
    lines: 12;
    fixed-height: false;
    padding: 5px;
    spacing: 4px;  /* Дополнительный отступ между элементами */
    background-color: rgba(40, 42, 54, 0);

}
element {
    background-color: rgba(68, 71, 90, 0.5);
    text-color: rgba(248, 248, 242, 1.0);  /* Полная непрозрачность */
    vertical-spacing: 6px;  /* Вертикальный отступ */
    horizontal-spacing: 8px; /* Горизонтальный отступ */
    border-radius: 4px;
}
element selected.normal {
    background-color: #44475a;
}
entry {
    placeholder: "Поиск...";
    margin: 0px 8px;  /* Отступы поля ввода */
    background-color: rgba(68, 71, 90, 0.5);
    border-radius: 4px;
}
')

# Выход, если ничего не выбрано
[ -z "$SELECTION" ] && exit

# Удаляем нумерацию (оставляем только текст)
TEXT_ONLY=$(echo "$SELECTION" | sed -E 's/^[0-9]+\. //; s/↲/\n/g')

# Копируем и вставляем через CopyQ
copyq add -- "$TEXT_ONLY" >/dev/null
copyq select 0 >/dev/null
copyq paste >/dev/null
