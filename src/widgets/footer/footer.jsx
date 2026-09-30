export const Footer = () => (
  <footer style={{ background: '#F5F5F7', paddingTop: 60, marginTop: 80 }}>
    <div style={{ maxWidth: 1230, margin: '0 auto', padding: '0 20px', display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 40 }}>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Топ категории</h4>
        {['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','Соцсети и реклама','Бизнес и жизнь','SEO и оптимизация'].map(c => <a key={c} href="/exchange" style={{ display: 'block', fontSize: 13, color: '#8B8B8B', padding: '6px 0' }}>{c}</a>)}
      </div>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>О Проекте</h4>
        {['О Нас','Как Это Работает','Политика Приватности','Правила Пользования','Пресса о нас'].map(c => <a key={c} href="/" style={{ display: 'block', fontSize: 13, color: '#8B8B8B', padding: '6px 0' }}>{c}</a>)}
      </div>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Поддержка</h4>
        {['Контакты','Политика Безопасности','FAQ'].map(c => <a key={c} href="/" style={{ display: 'block', fontSize: 13, color: '#8B8B8B', padding: '6px 0' }}>{c}</a>)}
      </div>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Follow</h4>
        <div style={{ display: 'flex', gap: 12, marginTop: 12 }}>
          {['f','t','i','in'].map((s, i) => <a key={i} href="/" style={{ width: 40, height: 40, borderRadius: '50%', background: i === 1 ? '#21B349' : '#1F1F1F', display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'white', fontSize: 16, fontWeight: 700 }}>{s}</a>)}
        </div>
      </div>
    </div>
    <div style={{ maxWidth: 1230, margin: '40px auto 0', padding: '24px 20px', borderTop: '1px solid #E5E5E5', textAlign: 'center', fontSize: 13, color: '#8B8B8B' }}>
      Copyright @ 2021 | WorkTap - Worktap.KZ. All Rights Reserved
    </div>
  </footer>
);
